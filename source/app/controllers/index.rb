get '/' do
  if session[:user_id]
    redirect to "/users/#{session[:user_id]}/posts"
  else
    erb :index
  end
end
