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
    curr_category.order(votes: :desc)
  end

  def format_time(time)
    time.strftime("%Y %m %d @ %H: %M: %S")
  end
 
  def check_flash
    @flash = session[:flash] if session[:flash]
    session[:flash] = nil
  end
end
