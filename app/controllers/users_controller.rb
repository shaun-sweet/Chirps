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
    erb :'users/edit?errors=User%20was%20not%20updated.'
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
    redirect '/users/new?error=Oops!%20The%20user%20was%20not%20created.'
  end
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
