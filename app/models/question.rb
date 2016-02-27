class Question < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true
  validates :time, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :option_a, presence: true, length: {maximum: 280}
  validates :option_b, presence: true, length: {maximum: 280}
  validate :tagged_user_is_registered
  def expire_time
    updated_at + time if time
  end

  def expired?
    time.nil? ? false : expire_time <= Time.now
  end

  def close_expired
      self.update(resolved: true)
  end

  def vote_count(answer)
    votes.where(value: answer).count
  end

  ## CUSTOM VALIDATIONS ##

  def tagged_user_is_registered
    if tagged_user.strip != "" && User.where(username: tagged_user).empty?
      errors.add(:tagged_user, "is not a registered user!")
    end
  end
 end
