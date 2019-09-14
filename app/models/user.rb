class User < ApplicationRecord
    #validations
    validates :trainer, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password 

    #associations 
    has_many :pokemons
    has_many :tms, through: :pokemons    

    #omni

    def self.find_or_create_by_facebook_omniauth(auth)
        user = User.find_by(email: auth['info']['email'])
    end
    
end