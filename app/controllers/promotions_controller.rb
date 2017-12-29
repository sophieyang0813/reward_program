class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.all
    @areas = Area.all
    @current_user_id = session[:user_id]
    @point_wallet =  PointWallet.where(user_id: session[:user_id])[0]
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
    @current_user_id = session[:user_id]
    @promotion = Promotion.find(params[:id])
    @point_wallet = PointWallet.find_by(user_id: current_user.id)
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  def search 
     @promotions = Promotion.all
     @point_wallet = PointWallet.find_by(user_id: current_user).id
     filtering_params(params).each do |key, value|
     @promotions = @promotions.public_send(key, value) if value.present?
     end 
  end 

  # POST /promotions
  # POST /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)
    @partner_id = session[:partner_id]
    respond_to do |format|
      if @promotion.save
        a = Partner.find_by(id: @partner_id)
        @promotion.update(promo: a.code + (0..9).to_a.sample(3).join)
        format.html { redirect_to @promotion, notice: 'Promotion was successfully created.' }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: 'Promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def filtering_params(params)
      params.slice(:name, :description, :promo)
     end 
    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit( :name, :reward_type, :value, :point, :description, :terms_conditions, :valid_from, :valid_to, :area_id)
    end
end
