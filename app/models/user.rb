class User < ApplicationRecord
    #validations
    validates :trainer, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password 

    #associations 
    has_many :pokemons
    has_many :tms, through: :pokemons    
end