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
  @live_questions = get_user_questions(@user, false)
  @expired_questions = get_user_questions(@user, true)
  @live_tagged = get_tagged_questions(@user, false)
  @expired_tagged = get_tagged_questions(@user, true)
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

##################################
#Delete                          #
##################################

delete '/questions/:qid/delete' do
  if request.xhr?
    content_type :json   
    @question = Question.find(params[:qid])
    @question.destroy
    {success: true, id: @question.id, message: "question delete"}.to_json
  end
end

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
  content_type :json
  @question = Question.find(params[:qid].to_i)
  @vote = current_user.add_or_update_vote(@question.id, params[:option].to_i)
  @vote.save
  array = []
  array << @question.vote_count(0)
  array << @question.vote_count(1)
  array.to_json
end

post '/questions/:qid/edit' do
  @question = current_user.questions.find(params[:qid])
  @question.attributes = {
    tagged_user: "",
    time: params[:time].to_i,
    resolved: false
  }
  if @question.save
    redirect request.referer
  else
    flash[:notice] = @question.errors.full_messages
    redirect request.referer
  end
end
