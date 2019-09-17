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

    def self.find_or_create_by_omniauth(auth)
    @user = User.find_by(email: auth["info"]["email"])
    if @user.uid.nil?
      @user.update(uid: auth["uid"])
    elsif @user.nil?
      @user = User.create_by(uid: auth["uid"]) do |u|
        u.email = auth["info"]["email"]
        u.password = SecureRandom.hex
      end
    end
    @user
  end
end