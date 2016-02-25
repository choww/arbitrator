# enable :sessions [already in config/environment.rb]
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
  if params[:cat_name].to_i == current_user.id
    @questions = current_user.questions
  elsif params[:cat_name] == 'top'
    @questions = popular_questions
  else
    session[:category] = params[:cat_name]
    @questions = curr_category
    #Question.where(category: params[:cat_name])
  end
  redirect '/'
end

get '/questions/new' do
  @question = Question.new
  erb :'/questions/new'
end


# ##########
# #STRETCH?#
# ##########
#   #view other users' pages with their questions, you cannot delete them


##################################
#Posts                           #
##################################

post '/' do
  @question = current_user.questions.new(
    category: params[:category],
    content: params[:content],
    time: params[:time_limit].to_i,
    option_a: params[:option_a],
    option_b: params[:option_b]
  )
  if @question.save
    redirect '/'
  else
    erb :'/questions/new'
  end 
end

post 'questions/:qid/vote' do
  @vote = current_user.votes.new(
    value: params[:option].to_i,
    question_id: params[:qid])
  if @vote.save
    redirect '/'
  else
    redirect '/'
  end
end
