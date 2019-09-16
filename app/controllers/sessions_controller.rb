class SessionsController < ApplicationController

  def login 
    @user = User.new
  end

  def create  
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :login
    end
  end

  def facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.password = 'password'
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end


  def logout
    session.delete :user_id
    redirect_to root_path
  end


  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end