class Script < ApplicationRecord
  has_many :user_scripts
  has_many :users, through: :user_scripts
  has_many :characters
  has_many :versions
  has_many :comments
  has_many :commenters, class_name: "User", foreign_key: :commenter_id
  has_one :title_page
end
