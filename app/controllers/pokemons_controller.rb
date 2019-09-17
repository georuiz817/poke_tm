class PokemonsController < ApplicationController
  before_action :current_user # @user avlaiable for all actions 
  before_action :logged_in? #makes sure some1 not logged in can create,view,delete pokemon 
  before_action :redirect_if_not_signed_in
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
        if params[:user_id]
          user = User.find_by(id: params[:user_id])
          if user.nil?
            redirect_to root_path, alert: "User not found."
          else
            @pokemon = user.pokemons.find_by(id: params[:id])
            redirect_to user_pokemons_path(@pokemon), alert: "Pokemon not found." if @pokemon.nil?
          end
        else
          @pokemon = Pokemon.find(params[:id])
        end
      end
      
      def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon.update(pokemon_params)
         redirect_to user_pokemon_path(@pokemon)
        else
          @errors = @pokemon.errors.full_messages
          render :edit
        end
      end

def destroy
  current_user.pokemons.find(params[:id]).destroy
  redirect_to root_path
end


  private

def pokemon_params
  params.require(:pokemon).permit(:name, :user_id, :tm_id)
end


end