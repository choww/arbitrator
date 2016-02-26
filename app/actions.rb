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
  if params[:cat_name] == current_user.username
    @questions = current_user.questions
  elsif params[:cat_name] == 'top'
    @questions = popular_questions
  else
    session[:category] = params[:cat_name]
    @questions = curr_category.order(created_at: :desc)
    #Question.where(category: params[:cat_name])
  end
  erb :'index'
end

get '/:username' do
  @user = User.find_by(username: params[:username])
  @questions = @user.questions
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
  @question = current_user.questions.new(
    category: params[:category],
    content: params[:content],
    time: params[:time],
    option_a: params[:option_a],
    option_b: params[:option_b]
  )
  if @question.save
    redirect '/'
  else
    erb :'/questions/new'
  end 
end

post '/questions/:qid/vote' do
  q_id = params[:qid]
  if current_user.id == Question.find(q_id).user_id
    @flash = "Fail"
  else
  @vote = current_user.votes.new(
    value: params[:option].to_i,
    question_id: q_id)
  end
  if @vote && @vote.save
    redirect '/'
  else
    redirect '/'
  end
end

# EVERYTHING BELOW NEEDS TO BE TESTED
post '/questions/:id/extend_time' do
#  if params[:answer] == 'yes'
#
end

post '/questions/:qid/edit' do
  @question = current_user.questions.find(params[:qid])
  @question.time = params[:time].to_i
  if @question.save
    redirect "/category/#{current_user.username}"
  else
    erb :'questions/edit'
  end
end
