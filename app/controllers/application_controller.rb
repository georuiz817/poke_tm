class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  

     def current_tm
        @tm = Tm.find_by(id: session[:tm_id])
      end
    
      private
      
        def current_user
          @user = User.find_by_id(session[:user_id]) 
       end
   
     
      def logged_in?
        !!session[:user_id]
    end


 end

