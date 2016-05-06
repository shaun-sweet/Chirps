
#show individual chirp
get '/chirps/:id' do

  erb :'/chirps/show'
end

#input new chirp
get '/chirps/new' do
  p "THIS IS HITTING ROUTE"
  erb :"/chirps/new"
end

#create new chirp
#******** FIX REDIRECT *********
post '/chirps' do

  redirect '/chirps/:id'
end


