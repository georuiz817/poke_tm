class PokemonsController < ApplicationController
  before_action :current_user # @user avlaiable for all actions 
  helper_method :logged_in? #makes sure some1 not logged in can create,view,delete pokemon 

  def index
    @pokemons = @user.pokemons
end


def show
  @pokemon = Pokemon.find(params[:id])
end

def new
@pokemon = Pokemon.new
end

def create
  @pokemon = current_user.pokemons.build(pokemon_params)
     if @pokemon.save
       redirect_to user_pokemons_path(current_user)
      else 
        render :new
      end
    end


def edit
end

def destroy
  @pokemon = Pokemon.find([:id])
  @pokemon.destroy
  redirect_to root_path
end

private

def pokemon_params
  params.require(:pokemon).permit(:name, :user_id, :tm_id)
end


end