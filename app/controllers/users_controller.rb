class UsersController < ApplicationController

  def show
  end
  
  def signup 
      @user = User.new
    end
  
  def create
      @user = User.create(user_params)
      if @user.id == nil 
        @errors = @user.errors.full_messages
        render :signup
      else
        session[:user_id] = @user.id
        redirect_to root_path
      end
    end
  

  
    private
      def user_params
        params.require(:user).permit(:trainer, :email, :password)
      end
  end