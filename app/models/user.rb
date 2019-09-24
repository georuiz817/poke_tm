class User < ApplicationRecord
    #validations
    validates :trainer, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 5 }
    has_secure_password 

    #associations 
    has_many :pokemons
    has_many :tms, through: :pokemons    

    #omni
    
  def get_email
    self.email.gsub(/\@.*/, "")
  end 

  ###edited for omni
  def self.find_or_create_by_omniauth(auth)
    user = User.find_by(email: auth['info']['email'])
  if user.nil?
       user = User.create(email: auth['info']['email'], password: SecureRandom.hex, uid: auth['uid'])
    elsif user.uid.nil?
       user.update(uid: auth['uid'])
       user
    end
    user
 end
 
end
  
  
