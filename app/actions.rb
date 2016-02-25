# enable :sessions [already in config/environment.rb]
# For voting create conditional if vote.user_id && vote.question_id then crash

# ##################################
# #Gets                            #
# ##################################

# #Main page where questions is sorted by created_at by default, it can go into 
# #any category
# get '/' do 
#   @user = User.find(session["user"])
#   #if session["category"] == nil
#     #questions = Question.all #This may change based on the category
#   # else
#   #   questions = Question.where('category_id = #{session["user"]}')
#   # end 
#   #if category is set by session["category"] which set to the category_id in the questions table
#   #
#   #@questions = questions.order(created_at: :desc) 
# #This orders it by created_at with the highest value at the top(most recent)
#   erb :index
# end

#CREATE Question page
get '/questions/new' do
  #Question.new(
  #
  #)
#This is taking the form information and making a new question object
  #erb :
end

#Question dedtails
get '/questions/:id/show' do
  #@question = Question.find params[:id]
  #erb :
end



#User Dashboard
get '/users/:id' do
  #erb :
end
# #CREATE Question page
# get '/questions/new' do
#   #Question.new(
#   #
#   #)
# #This is taking the form information and making a new question object
#   erb :
# end

# #Question dedtails
# get '/questions/:id/show' do
#   #@question = Question.find params[:id]
#   erb :
# end



# #User Dashboard
# get '/users/:id' do
#   erb :
# end

# ##########
# #STRETCH?#
# ##########
#   #view other users' pages with their questions, you cannot delete them


# ##################################
# #Posts                           #
# ##################################

# post '/questions/new' do
#   @question = Question.new(
#     user_id: session["user"],
#     category: params[:category],
#     content: params[:content],
#     option_a: params[:option_a],
#     option_b: params[:option_b]
#   )
# #This is taking the form information and making a new question object
#   if @question.save
#     redirect '/'
#   else
#     erb :'/questions/new'
#   end
# end

post '/questions/:id' do
#For the vote information
  @question = Question.find(params[:id])
  @vote = Vote.new(
    user_id: session["user"],
    question_id: params[:id],
    value: params[:value]
    )
  #if @question.user == session["user"]
   # do nothing
  #if session["user"]
  redirect '/questions/:id'
end
