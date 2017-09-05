class Character < ApplicationRecord
  belongs_to :script
  has_many :versions, through: :script
  has_many :user_scripts, through: :script
  has_many :users, through: :script
end
