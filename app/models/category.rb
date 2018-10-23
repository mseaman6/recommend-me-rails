class Category < ApplicationRecord
  has_many :users, through: :recommendations
  has_many :recommendations

  validates :name, :presence => true
end
