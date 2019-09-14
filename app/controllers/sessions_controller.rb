class SessionsController < ApplicationController

  def login 
    @user = User.new
  end

  def create  
      if auth
        @user = User.find_or_create_by_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to root_path
      else
     redirect_to root_path
      end
    else  
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
end


  def logout
    session.delete :user_id
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def auth
      request.env['omniauth.auth']
    end
end