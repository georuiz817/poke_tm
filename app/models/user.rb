class User < ApplicationRecord
    #validations
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 5 }
    has_secure_password 

    #associations 
    has_many :pokemons
    has_many :tms, through: :pokemons    

    #omni
    
  ###edited for omni
  def self.find_or_create_by_omniauth(auth)
    self.where(email: auth['info']['email']).first_or_create do |user|
        user.password = SecureRandom.hex
        user.email = auth['info']['email']
      end
  end
 
end
  
  
