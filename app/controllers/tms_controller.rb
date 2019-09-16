class TmsController < ApplicationController

  
    def index
        @tms = Tm.all
    end

    def new
        
    end

    def create
    
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

 
