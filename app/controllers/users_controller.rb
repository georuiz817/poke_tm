class UsersController < ApplicationController
  before_action :redirect_if_signed_in
  def show
  end
  
  def signup 
      @user = User.new
    end
  
    def create  
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_pokemons_path(@user)
      else
        render :new
      end
    end
  

  
    private
      def user_params
        params.require(:user).permit(:trainer, :email, :password)
      end
  end