class Tm < ApplicationRecord
    has_many :pokemons 
    has_many :users, through: :pokemons 
end
