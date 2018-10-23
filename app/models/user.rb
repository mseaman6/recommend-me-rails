class User < ApplicationRecord
  has_secure_password

  has_many :recommendations
  has_many :categories, through: :recommendations
  has_many :comments
  has_many :recommendations, through: :comments

  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

  validates :username, uniqueness: true
  validates :email, :uniqueness => true

end
