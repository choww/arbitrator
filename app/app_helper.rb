helpers do
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end

  def category
    session[:category] || 'newest'
  end

  def format_time(time)
    time.strftime("%Y %m %d @ %H: %M: %S")
  end

  def check_flash
    @flash = session[:flash] if session[:flash]
    session[:flash] = nil
  end
end
