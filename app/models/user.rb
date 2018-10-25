class User < ApplicationRecord
  has_secure_password

  has_many :recommendations
  has_many :categories, through: :recommendations
  has_many :comments
  has_many :commented_recommendations, :through => :comments, :source => :recommendation

  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

  validates :name, uniqueness: true
  validates :email, :uniqueness => true

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create(:email => auth.info.email, :name => auth.info.name, :password => auth.uid)
  end
end
