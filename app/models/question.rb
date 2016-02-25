class Question < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :option_a, presence: true, length: {maximum: 280}
  validates :option_b, presence: true, length: {maximum: 280}
end