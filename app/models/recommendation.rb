class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :commentors, :class_name => 'User', through: :comments

  validates :title, :presence => true
  validates :category_id, :presence => true

  scope :recent, -> {where("created_at >= ?", (Time.now - 1.month))}
  #scope :authored_by(x), -> { where("user_id = ?", x) }
  #issue with session hash not being available in the model - how to get around?
  #scope :recent, -> { where(recommendation.created_after(time.now - 1.month))}


end
