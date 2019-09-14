class PokemonsController < ApplicationController
  before_action :is_logged_in? 
  before_action :current_user
  before_action :set_user

   
  def show
    @pokemon = Pokemon.find(params[:id])
  end
  
    def index
      @pokemons = @user.pokemons
    end
 
 
  def new
    @pokemon= Pokemon.new(user_id: params[:user_id])
  end

  def create
    @pokemon = @user.pokemons.build(pokemon_params)
    @pokemon.save
    redirect_to pokemon_path(@pokemon)
  end

  def edit
    
  end



  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :user_id)
  end


def set_user
  @user = User.find_by_id(params[:user_id])
end

def set_pokemon
  @pokmeon = Pokemon.find_by_id(params[:id])
end

end

