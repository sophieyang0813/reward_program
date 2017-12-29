class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


private 
  def current_user
    @current_user ||= 
      session[:user_id] && User.find_by(id: session[:user_id]) ||
      session[:partner_id] && Partner.find_by(id: session[:partner_id])
  end 

  helper_method :current_user 
end
