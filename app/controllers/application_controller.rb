class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  
#you're in the right place
  private
      
        def current_user
          @user = User.find_by_id(session[:user_id]) 
       end
   
     
      def logged_in?
        !!session[:user_id]
    end


 end

