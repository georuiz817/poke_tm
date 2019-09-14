class PokemonsController < ApplicationController

  def index
    @user = current_user
    @pokemons = User.find(params[:user_id]).pokemons
    @pokemons = @pokemons.where(user_id: @user.id)
    
  end 


def show
  @pokemons = Pokemon.find(params[:id])
end

def new
  @pokemon = Pokemon.new
end

def create
  pokemon = Pokemon.new(pokemon_params)
  if pokemon.save
    redirect_to root_path
  else
    erb :new
  end
end

def edit
  
end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :user_id)
  end

end

