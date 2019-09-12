class TmsController < ApplicationController
    def index
        @tms = tm.all
    end

    def new
        @tm = Tm.new
    end

    def create
        @tm = Tm.create(tm_params)
        if @tm
          redirect_to root_path
        else
          render :new
        end
      end

      def show
      end
    
      def edit
      end
    
      def update
        @tm.update(tm_params)
        if @tm.save
          redirect_to root_path
        else
          render :edit
        end
      end

private
def tm_params
    params.require(:tm).permit(:name, :type, :rarity)
  end
end

 
