class PokemonsController < ApplicationController
  before_action :current_user # @user avlaiable for all actions 
  before_action :logged_in? #makes sure some1 not logged in can create,view,delete pokemon 

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
     
      end
      
        def update
          if @pokemon.update(task_params)
            user_pokemons_path
          else
            render :edit
          end
        end
        

def destroy
  Pokemon.find(params[:id]).destroy
  redirect_to root_path
end
private

def pokemon_params
  params.require(:pokemon).permit(:name, :user_id, :tm_id)
end


end