helpers do

  def current_user
    User.find(session[:id])
  end

  def logged_in?
    if session[:id]
     return @current_user = User.find(session[:id])
    else
      redirect '/login'
    end
  end
end
