# For voting create conditional if vote.user_id && vote.question_id then crash
before do 
  current_user if logged_in? 
end
### FOR TEST PAGE ###

get '/test' do
  questions = Question.all
  @questions = questions.order(created_at: :desc)
  erb :test
end

### THE REAL ROUTES ###

##################################
#Gets                            #
##################################

get '/' do
  @questions = curr_category.order(created_at: :desc)
  erb :index
end

get '/category/:cat_name' do
  if params[:cat_name] == 'top'
    session[:category] = 'top'
    @questions = popular_questions
  else
    session[:category] = params[:cat_name]
    @questions = curr_category.order(created_at: :desc)
  end
  erb :index
end

get '/:username' do
  @user = User.find_by(username: params[:username])
  @live_questions = @user.questions.where(resolved: false).order(created_at: :desc)
  @expired_questions = @user.questions.where(resolved: true).order(created_at: :desc)
  @tagged_questions = Question.where(tagged_user: @user.username).order(created_at: :desc)
  erb :'users/show'
end

get '/login/:id' do
  session[:id] = params[:id]
  redirect '/'
end

get '/questions/new' do
  @question = Question.new
  erb :'/questions/new'
end

# ##########
# #STRETCH?#
# ##########

##################################
#Posts                           #
##################################

post '/' do
  params[:time].to_i unless params[:time].nil?
  @question = current_user.questions.new(params[:question])

  if @question.save
    redirect '/'
  else
    erb :'/questions/new'
  end 
end

post '/questions/:qid/vote' do
  @question = Question.find(params[:qid].to_i)
  if created?(@question) || tagged?(@question)
    flash[:notice] = "Can't vote on your own questions or questions you're tagged in!"
  else
    @vote = current_user.add_or_update_vote(params[:qid].to_i, params[:option].to_i)
    redirect '/' unless @vote.save  
  end
  redirect request.referer
end

post '/questions/:qid/edit' do
  @question = current_user.questions.find(params[:qid])
  @question.attributes = {
    time: params[:time].to_i,
    resolved: false
  }
  if @question.save
    redirect request.referer
  else
    erb :'questions/edit'
  end
end
