#input new chirp
get '/chirps/new' do
  p "THIS IS HITTING ROUTE"
  erb :'chirps/new'
end

#create new chirp
#******** FIX REDIRECT *********
post '/chirps' do
  @new_chirp = Chirp.create(body: params[:body])
  #redirect to chirp show page
  redirect "/chirps/#{@new_chirp.id}"
end

get '/chirps' do
  p "this is a fucking route"
  erb :test
end

#show individual chirp
get '/chirps/:id' do
@chirp = Chirp.find(params[:id])
  erb :'/chirps/show'
end
