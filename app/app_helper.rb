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
    # a = Question.all
    # a.find_by_sql('SELECT questions.*, count(votes.id) AS total_votes 
    #   FROM questions 
    #   JOIN votes ON questions.id = votes.question_id 
    #   GROUP BY questions.id ORDER BY total_votes DESC;')
    # a.order(:total_votes)
    Question.all.sort {|q1, q2| q1.votes.count <=> q2.votes.count}.reverse
  end

  def format_time(time)
    (Time.now - time)/60
    #time.strftime("%Y %m %d @ %H: %M: %S")
  end
 
  def check_flash
    @flash = session[:flash] if session[:flash]
    session[:flash] = nil
  end
end
