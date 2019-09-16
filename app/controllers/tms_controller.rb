class TmsController < ApplicationController

  
    def index
        @tms = Tm.all
    end

    def new
        @tm = Tm.new
    end

    def create
      @tm = Tm.create(tm_params)
      @tm.save
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

 
