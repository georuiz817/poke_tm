class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  
  def redirect_if_not_signed_in
    redirect_to login_path unless logged_in?
  end

  def redirect_if_signed_in
    redirect_to root_path if logged_in?
  end
  private
      
  def logged_in?
        !!session[:user_id] 
    end

    def current_user
      @user = User.find_by_id(session[:user_id]) if logged_in?
   end


 end

