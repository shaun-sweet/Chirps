get '/' do
  # Send to login page if they aren't logged in
  redirect '/login' unless session[:id]
  # Send to user profile/show page if they are logged in
  redirect "/users/#{session[:id]}"
end
