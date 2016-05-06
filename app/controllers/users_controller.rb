# Index action
get '/users' do
  @users = User.all
  erb :'users/index'
end

# Show action
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# Edit action
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

# Update action
put '/users/:id' do
  @user = User.find(params[:id])

  @user.assign_attributes(params[:user])

  if @user.save
    redirect '/users'
  else
    erb :'users/edit?errors=Oops! The user was not updated.'
  end
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
    redirect '/users/new?error=Oops! The user was not created.'
  end
end

# Destroy action
delete 'users/:id' do
  @user = User.find(params[:id])

  if @user.destroy
    redirect '/users'
  else
    redirect '/users?errors=User was not destroyed.'
  end
end
