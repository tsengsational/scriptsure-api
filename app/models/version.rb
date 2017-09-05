class Version < ApplicationRecord
  belongs_to :script
  has_many :user_scripts, through: :script
  has_many :users, through: :user_scripts
  has_many :comments, through: :script
  has_many :characters, through: :script
  has_many :actors, through: :characters
end
