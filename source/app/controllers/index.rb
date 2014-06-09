get '/' do
  if session[:user_id]
    redirect to '/posts'
  else
    erb :index
  end
end
