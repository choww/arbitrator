helpers do
  def logged_in?
    !session[:id].nil?
  end

  def current_user
   # uid = logged_in? ? 
    @user = logged_in? ? User.find(session[:id]) : User.new
  end

  def created?(question)
    current_user == question.user 
  end

  def tagged?(question)
    if question.tagged_user 
      current_user.username == question.tagged_user
    end
  end

  def get_user_questions(user,status)
    Question.where(user_id: user.id, resolved: status).order(created_at: :desc)
  end

  def get_tagged_questions(user, status)
    Question.where(resolved: status, tagged_user: user.username).order(created_at: :desc)
  end

  def curr_category
    filter = Question.where(category: session[:category])
    filter.exists? ? filter :  Question.all 
  end

  # where option is 0 or 1
  def winner?(question, option)
    hi_score = [question.vote_count(0), question.vote_count(1)].max
    question.vote_count(option) == hi_score
  end

  def draw?(question)
    question.vote_count(0) == question.vote_count(1)
  end

  def popular_questions
    Question.all.sort {|q1, q2| q2.votes.count <=> q1.votes.count}
  end

  #def format_time(time)
  #  local_time = time.getlocal
  #  (Time.now - local_time).abs
  #end
 
end
