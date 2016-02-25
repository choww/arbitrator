class Question < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :option_a, presence: true, length: {maximum: 280}
  validates :option_b, presence: true, length: {maximum: 280} 

  def expire_time
    if time.nil?
      Time.now + 20.years
    else
      self.created_at + time.seconds 
    end
  end

  def expired?
    expire_time <= Time.now 
  end  

  def close_expired
    if expired?
      self.resolved = true
      self.save
    end
  end

  def vote_count(answer)
    votes.where(value: answer).count
  end
end



