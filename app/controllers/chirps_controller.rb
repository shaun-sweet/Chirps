#input new chirp
get '/chirps/new' do
  erb :'chirps/new'
end

#create new chirp
#******** FIX REDIRECT *********
post '/chirps' do
  @new_chirp = Chirp.create(body: params[:body])
  #redirect to chirp show page
  redirect "/users/index"
end

get '/chirps' do
  # We want to list all of
  # the tweets on the user profile page
  redirect "/login" unless session[:id]
  @user = User.find(session[:id])
  redirect "/users/#{ @user.id }"
end

#show individual chirp
get '/chirps/:id' do
  redirect "/login" unless session[:id]
  @chirp = Chirp.find(params[:id])
  erb :'/chirps/show'
end


