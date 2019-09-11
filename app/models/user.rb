class User < ApplicationRecord
    validates :trainer, presence: true
    validates :email, presence: true, uniqueness: true
    has_secure_password 
end