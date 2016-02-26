class User < ActiveRecord::Base
  has_many :questions
  has_many :votes
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def get_vote(question)
    votes.find_by(user_id: id, question_id: question)
  end

  def add_or_update_vote(question, option)
    if get_vote(question).nil?
      votes.new(value: option, question_id: question)
    else
      get_vote(question).update(value: option)
      get_vote(question)
    end
  end
end
