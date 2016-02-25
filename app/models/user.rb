class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end