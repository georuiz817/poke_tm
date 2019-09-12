class Pokemon < ApplicationRecord
  belongs_to :user 
  belongs_to :tm
end
