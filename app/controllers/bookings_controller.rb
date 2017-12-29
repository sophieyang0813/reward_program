class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @area = Area.find(params[:area_id])
    @booking = Booking.find(params[:id])
    @client_token = Braintree::ClientToken.generate 
    @user = session[:user_id]
    # @user = @current_user 
    @promotion = Promotion.find_by(area_id: @booking.area_id)
    @purchased_coupon = PurchasedCoupon.find_by(point_wallet_id: @booking.point_wallet_id)
    @total_price = @area.price_per_night * ((@booking.check_out - @booking.check_in)/86400)
    

  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @area = Area.where(id: params[:area_id])
    @pointwallet_id = PointWallet.where(user_id: current_user.id)[0].id
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
    @user = @current_user
    # @purchased_coupon 
    @hello = 25
    @booking.update(purchased_coupon_id: @hello)
    # @booking(coupon_params).update
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @pointwallet_id = PointWallet.where(user_id: current_user.id)[0].id
    @booking.point_wallet_id = @pointwallet_id 
    @area = Area.find(params[:booking][:area_id])
    @point_wallet = PointWallet.find(params[:booking][:point_wallet_id])


    respond_to do |format|
      if @booking.save
        format.html { redirect_to area_booking_url(@area,@booking) }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  def checkout 
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    @area = Area.find(params[:area_id])
    @booking = Booking.find(params[:booking_id])
    @booking.total_price = @area.price_per_night * ((@booking.check_out - @booking.check_in)/86400)
    @booking.purchased_coupon_id = params[:purchased_coupon_id]
    @booking.discounted_price = params[:discount_price]
    @booking.update(total_price: @booking.total_price, purchased_coupon_id: @booking.purchased_coupon_id, discounted_price: @booking.discounted_price)
    @pointwallet = current_user.point_wallet

    @user = current_user
    @partner = Partner.where(id: 
      Area.where(id: @area)[0].partner_id)[0]


    if @booking.purchased_coupon_id != nil  
      result = Braintree::Transaction.sale(
      :amount => @booking.discounted_price,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true 
       }
      )
    else 
        result = Braintree::Transaction.sale(
        :amount => @booking.total_price,
        :payment_method_nonce => nonce_from_the_client,
        :options => {
          :submit_for_settlement => true 
         }
        )
    end 

    if result.success?
       redirect_to :root, notice: "Transaction successful. Please check your email inbox."
      BookingMailer.partner_booking_email(@user, @partner, @booking).deliver_now
      BookingMailer.customer_booking_email(@user, @partner, @booking).deliver_now

      if @booking.purchased_coupon_id != nil  
          @pointwallet.update(earned: @booking.discounted_price) 
      else 
          @pointwallet.update(earned: @booking.total_price) 
      end 
     
    else
       redirect_to :root, notice: "Transaction failed. Please try again."
    end 
  end 

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:area_id, :point_wallet_id, :check_in, :check_out, :total_price)
    end

    # def coupon_params
    #     params.require(:booking).permit(:purchased_coupon_id)
    # end 


end
