helpers do
  def logged_in?
    redirect '/login' unless session[:id]
  end
end
