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

#show page like route
post '/like/:chirp_id' do
  logged_in?
  Like.create(user_id: session[:id], chirp_id: params[:chirp_id])
  redirect "/users/#{Chirp.find(params[:chirp_id]).user.id}"
end
