class Actor < ApplicationRecord
  has_many :characters
  has_many :scripts, through: :characters 
end
