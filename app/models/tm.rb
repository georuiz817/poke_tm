class Tm < ApplicationRecord
    #validations
    validates :name, presence: true
    validates :element, presence: true 
    validates :rarity, presence: true 

    #associations 
    has_many :pokemons 
    has_many :users, through: :pokemons 
end
