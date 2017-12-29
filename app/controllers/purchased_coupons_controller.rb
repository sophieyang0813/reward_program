class PurchasedCouponsController < ApplicationController



  def new
    @purchased_coupon = PurchasedCoupon.new 
    @promotion = Promotion.find(params[:promotion_id])
    @user_id = session[:user_id]
    @point_wallet = PointWallet.find_by(user_id: @user_id)
  end


  def create
    @purchased_coupon = PurchasedCoupon.new 
    @promotion = Promotion.find(params[:promotion_id])
    @pointwallet = PointWallet.find(params[:point_wallet_id])
    @purchased_coupon.promotion_id = @promotion.id
    @purchased_coupon.point_wallet_id = @pointwallet.id
    @purchased_coupon.user_id = current_user.id
    

    respond_to do |format|
        if @purchased_coupon.save
        @pointwallet.update(balance: @pointwallet.balance - @promotion.point, redeemed:@promotion.point)

        format.html { redirect_to promotions_url, notice: "Coupon was successfully purchased with points" }
        else 
         format.html { render :new, notice: "try again. transaction did not go through" }
        end 
    end 

  end

end 