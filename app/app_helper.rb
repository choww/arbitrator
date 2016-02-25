helpers do
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @user = User.find(1) #ONLY FOR TEST PURPOSE
  end

  def curr_category
    Question.where(category: session[:category]) || Question.all
  end

  def format_time(time)
    time.strftime("%Y %m %d @ %H: %M: %S")
  end
 
  def check_flash
    @flash = session[:flash] if session[:flash]
    session[:flash] = nil
  end
end
