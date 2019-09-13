class TmsController < ApplicationController
  before_action :is_logged_in? 
  before_action :current_user
  
    def index
        @tms = Tm.all
    end

    def new
        @tm = Tm.new
    end

    def create
        @tm = Tm.create(tm_params)
        if @tm.save
          redirect_to root_path
        else
          render :new
        end
      end

      def show
        @tm = Tm.find(params[:id])
      end
    
      def edit
      end
    
    
private
def tm_params
    params.require(:tm).permit(:name, :type, :rarity, )
  end
end

 
