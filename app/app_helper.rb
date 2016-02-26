helpers do
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @user = User.find(session[:id]) 
  end

  def curr_category
    filter = Question.where(category: session[:category])
    filter.exists? ? filter :  Question.all 
  end

  def popular_questions
    Question.all.sort {|q1, q2| q1.votes.count <=> q2.votes.count}.reverse
  end

  def format_time(time)
    local_time = time.getlocal
    (Time.now - local_time).abs / 60
  end
 
  def check_flash
    @flash = session[:flash] if session[:flash]
    session[:flash] = nil
  end
end
