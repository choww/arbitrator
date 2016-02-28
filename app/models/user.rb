class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  def add_or_update_vote(question, option)
    get_vote = Vote.find_or_create_by(user_id: id, question_id: question)
    get_vote.value = option
    get_vote
  end

end
