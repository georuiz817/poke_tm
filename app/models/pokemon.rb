class Pokemon < ApplicationRecord
  #validations
  validates :name, presence: true


  #associations 
  belongs_to :user # user will be able to create,show,index pokemon user/:user_id/pokemons
  belongs_to :tm   # a pokemon will belong to a TM when eqipped during the create or edit
  

end
