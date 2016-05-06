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
      # FIX THIS ERROR MESSAGE
      redirect '/login?error=Wrong%20combination%20of%20user%20and%20password'
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
    redirect '/login?error=You%20should%20be%20logged%20in%20to%20access!'
  end
end
