class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :question_id, presence: true
  validates :user_id, presence: true 
  validates :value, presence: true
  #validate :no_new_votes_if_expired
  
  ## CUSTOM VALIDATIONS ##
  def no_new_votes_if_expired
    if question && question.expired?
      errors.add(:question, "can't be voted on if expired")
    end    
  end 

    
end
