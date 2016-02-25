class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true
  # callback :resolve, if: :expired
  # validate :no votng if expired --maybe
  # def no voting if expired method
  #   if expired
  #     adk
  #   end
  # end
  #     
end
