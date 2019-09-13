class UsersController < ApplicationController

  def signup 
      @user = User.new
    end
  
    def create 
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
   
    def show
      if logged_in?
        @user = User.find(params[:id])
        @pokemons = Pokemon.all
      else
        redirect_to '/login'
      end
    end
  
    private
      def user_params
        params.require(:user).permit(:trainer, :email, :password)
      end
  end