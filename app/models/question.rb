class Question < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true
  validates :time, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :option_a, presence: true, length: {maximum: 280}
  validates :option_b, presence: true, length: {maximum: 280} 

  def expire_time
    created_at + time.seconds if time
  end

  def expired?
    time.nil? ? false : expire_time <= Time.now  
  end  

  def close_expired
      self.resolved = true
      self.save
  end

  def vote_count(answer)
    votes.where(value: answer).count
  end
end



