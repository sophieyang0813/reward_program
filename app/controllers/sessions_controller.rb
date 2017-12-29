class SessionsController < ApplicationController

 def new
 end

  def create
    @user = User.find_by(email: params[:session][:email])
    @partner = Partner.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to areas_path
    elsif @partner && @partner.authenticate(params[:session][:password])
      session[:partner_id] = @partner.id
      redirect_to areas_path
    else 
      flash[:warning] = "Invalid username or password"
      redirect_to new_session_path
    end 
  end

  def destroy
    session[:user_id] = nil || session[:partner_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end 


end 