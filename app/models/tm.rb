class Tm < ApplicationRecord
    #validations
    validates :name, presence: true
    validates :element, presence: true 
    validates :rarity, presence: true 

    #associations 
    has_many :pokemons 
    has_many :users, through: :pokemons 

    scope :rarity, -> { where(:rarity => 'Very Rare')}
end
