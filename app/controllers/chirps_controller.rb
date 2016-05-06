#input new chirp
get '/chirps/new' do
  logged_in?
  erb :'chirps/new'
end

#create new chirp
#******** FIX REDIRECT *********
post '/chirps' do
  logged_in?
  @new_chirp = Chirp.create(body: params[:body])
  #redirect to chirp show page
  redirect "/users/index"
end

get '/chirps' do
  # We want to list all of
  # the tweets on the user profile page
  logged_in?
  @user = User.find(session[:id])
  redirect "/users/#{ @user.id }"
end

#show individual chirp
get '/chirps/:id' do
  logged_in?
  @chirp = Chirp.find(params[:id])
  erb :'/chirps/show'
end

#Submit a new comment to a chirp
post '/chirps/:chirp_id/comment' do
  logged_in?
  @comment = Comment.create(body: params[:body],chirp_id: params[:chirp_id])

  redirect "/chirps/#{params[:chirp_id]}"
end
