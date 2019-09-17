class SessionsController < ApplicationController

  
  def login 
    @user = User.new
  end

  def create # post login
    if auth
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_pokemons_path(@user)
    else
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_pokemons_path(@user)
      else
        render :signup
      end
    end
  end

def logout
  session.delete :user_id
  redirect_to root_path
end


  private
  def auth
    request.env['omniauth.auth']
  end
  
  def user_params
  params.require(:user).permit(:email, :password)
  end
end



