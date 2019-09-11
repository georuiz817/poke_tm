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
        render :new
      end
    end

    def show
      if is_logged_in?
        @user = User.find_by_id(params[:id])
      else
        redirect_to root_path
      end
    end
  
    private
      def user_params
        params.require(:user).permit(:trainer, :email, :password)
      end
  end