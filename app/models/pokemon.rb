class Pokemon < ApplicationRecord
  #validations
  validates :name, presence: true


  #associations 
  belongs_to :user 
  belongs_to :tm
end
