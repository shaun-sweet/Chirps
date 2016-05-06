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

#add a like to specific chirp
post '/chirps/:id/like' do
  logged_in?
  chirp_id = params[:id]
  Like.create(user_id: session[:id],chirp_id: chirp_id)
  redirect "/chirps/#{params[:id]}"
end

#add a like to a comment
post '/comment/:id/like/:chirp_id' do
logged_in?
  comment_id = params[:id]
  Like.create(user_id: session[:id],comment_id: comment_id)
  redirect "/chirps/#{params[:chirp_id]}"
end

