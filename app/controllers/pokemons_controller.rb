class PokemonsController < ApplicationController
  before_action :is_logged_in? 
  before_action :current_user
  before_action :set_user
  def index
    @pokemons = Pokemon.all
 end
  

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.create(pokemon_params)
    @pokemon.user_id = current_user.id
    @pokemon.save
    redirect_to root_path
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