class PokemonsController < ApplicationController
  before_action :redirect_if_not_signed_in
  before_action :set_user
  before_action :set_pokemon, except: [:index, :new, :create]

  def index #user can view all the pokemon in there group
    @pokemons = @user.pokemons
end


def show # user can look at a specific pokemon
  @pokemon = Pokemon.find(params[:id])
end

def new
  @pokemon = Pokemon.new
end

def create #created a new pokemon for the specific user, renders errors if any
  @pokemon = current_user.pokemons.build(pokemon_params)
     if @pokemon.save
       redirect_to user_pokemons_path(current_user)
      else 
        @errors = @pokemon.errors.full_messages
        render :new
      end
    end


def edit
  redirect_to user_pokemons_path(current_user) unless current_user == @user
end

def update
  if @pokemon.update(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  else
    @errors = @pokemon.errors.full_messages
    render :edit
  end
end

      
def destroy
  @pokemon.destroy
  redirect_to root_path
end

private
    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def set_pokemon
      @pokemon = Pokemon.find_by_id(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name, :user_id, :tm_id)
    end
   
end