class PointWalletsController < ApplicationController

  def show
    @pointwallet = PointWallet.find_by(user_id: current_user)
    @purchased_coupons = PurchasedCoupon.where(point_wallet_id: params[:id])
    @promotions = Promotion.all
  
 
  end

  def new 
    @promotions = Promotion.all
  end 


  def create
  end 

end 