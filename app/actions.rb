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
  @live_questions = @user.questions.where(resolved: false)
  @expired_questions = @user.questions.where(resolved: true)
  @tagged_questions = Question.where(tagged_user: @user.username)
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

get '/questions/:qid/edit' do 
  @question = current_user.questions.find(params[:qid])
  erb :'questions/edit'
end

# ##########
# #STRETCH?#
# ##########
#   #view other users' pages with their questions, you cannot delete them


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
  if current_user == @question.user || current_user.username == @question.tagged_user
    @flash = "Can't vote on your own questions or questions you're tagged in!"
    redirect '/'
  else
    @vote = current_user.add_or_update_vote(params[:qid].to_i, params[:option].to_i)
    @vote.save ? redirect('/') : redirect('/')
  end
end

# EVERYTHING BELOW NEEDS TO BE TESTED
#post '/questions/:id/extend_time' do
#  if params[:answer] == 'yes'
#
#end

post '/questions/:qid/edit' do
  @question = current_user.questions.find(params[:qid])
  @question.time = params[:time].to_i
  if @question.save
    redirect "/category/#{current_user.username}"
  else
    erb :'questions/edit'
  end
end
