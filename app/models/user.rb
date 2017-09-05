class User < ApplicationRecord
  has_secure_password
  has_many :user_scripts
  has_many :scripts, through: :user_scripts
  has_many :versions, through: :scripts
  has_many :characters, through: :scripts
  has_many :comments, foreign_key: :commenter_id
end
