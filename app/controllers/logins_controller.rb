get '/login' do
  @error = params[:error]
  erb :login
end

post '/login' do
  if session[:id]
    redirect '/'
  else
    email = params[:email]
    password = params[:password]
    new_user = User.find_by(email: email)
    if new_user && new_user.authenticate(password)
      session[:id] = new_user.id
      redirect '/'
    else
      redirect '/login?error=Wrong combination of user and password'
    end
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/secret' do
  if session[:id]
    erb :secret
  else
    redirect '/login?error=You should be logged in to access!'
  end
end
