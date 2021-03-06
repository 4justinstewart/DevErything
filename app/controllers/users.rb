enable :sessions

before '/users/*' do
  redirect '/' unless session[:user_id]
end

before '/posts/*' do
  redirect '/' unless session[:user_id]
end

post '/signin' do
  email = params[:email]
  password = params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect "/posts"
  else
    redirect '/'
  end
end

get '/signup' do
  erb :'users/create_account'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to '/posts'
  else
    redirect to '/'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect to '/'
end
