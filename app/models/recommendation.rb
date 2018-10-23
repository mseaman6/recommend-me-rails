class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :commentors, :class_name => 'User', through: :comments

  validates :title, :presence => true
  validates :category_id, :presence => true

end
