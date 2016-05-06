# Index action
get '/users' do
  logged_in?
  @users = User.all
  erb :'users/index'
end

# New action
get '/users/new' do
  erb :'users/new'
end

# Create action
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/users'
  else
    redirect '/users/new?error=Oops!%20The%20user%20was%20not%20created.'
  end
end

# Show action
get '/users/:id' do
  logged_in?
  @user = User.find(params[:id])

  @relation = Following.find_by(user_id: params[:id], follower_id: @current_user.id)
  # puts ">>>>>>>>>>>#{relation} ....."
  erb :'users/show'
end

# Edit action
get '/users/:id/edit' do
  logged_in?
  @user = User.find(params[:id])
  erb :'users/edit'
end

# Update action
put '/users/:id' do
  logged_in?
  @user = User.find(params[:id])

  @user.assign_attributes(params[:user])

  if @user.save
    redirect '/users'
  else
    erb :'users/edit?errors=User%20was%20not%20updated.'
  end
end

#User follow another user
get '/users/:id/follow/:to_follow_id' do
  Following.create(follower_id: params[:id], user_id: params[:to_follow_id])
  redirect '/'
end
get '/users/:id/unfollow/:to_follow_id' do
  Following.find_by(follower_id: params[:id], user_id: params[:to_follow_id]).destroy
  redirect '/'
end

# Destroy action
delete 'users/:id' do
  @user = User.find(params[:id])

  if @user.destroy
    redirect '/users'
  else
    redirect '/users?errors=User%20was%20not%20destroyed.'
  end
end

# User followers page
get "/users/:id/followers" do
  logged_in?

  @user = User.find(params[:id])

  erb :'users/followers'
end

# User followings page
get "/users/:id/followings" do
  logged_in?

  @user = User.find(params[:id])

  erb :'users/followings'
end

