class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true
  after_update :resolve_question
  validate :no_new_votes_if_expired

  ## CALLBACKS ##
  def resolve_question
    if question.expired? 
      question.update(:resolved, true)
    end  
  end
  
  ## CUSTOM VALIDATIONS ##
  def no_new_votes_if_expired
    if question.expired?
      errors.add(:question, "can't be voted on cause it's expired")
    end    
  end 
end
