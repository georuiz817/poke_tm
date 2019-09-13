class PokemonsController < ApplicationController
  
  
  def index
    @pokemons = current_user.pokemons.all 
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

   def destroy
    Pokemon.find(params[:id]).destroy
    redirect_to root_path
  end


  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end

category_ids:[]