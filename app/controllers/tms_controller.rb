class TmsController < ApplicationController

  
    def index #a user will be able to view all avaliable TMs and there attributes
        @tms = Tm.all
    end

    def new
        #seeded in finite TMS. Not apart of project requirements to have a user be able to create 
        #a TM. 
    end

    def create
    # see above 
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

 
