get '/' do
  if logged_in?
    'HI'
  else
    'none'
  end
# erb :index
end
