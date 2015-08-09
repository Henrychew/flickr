get '/' do
  erb :"users/index"
end


# CREATE-CREATE
post '/users/signup' do
  @user = User.new(params[:user])

  if @user.save
    session[:id] = @user.id
    redirect to "/albums"
  else
    erb :"users/index" #back to main page
  end

end

#READ - SHOW
post '/users/login' do
  @user = User.authenticate(params[:user])
  
  if @user
    session[:id] = @user.id
    redirect to "/albums"
  else
    erb :"users/index"
  end

end



delete '/logout' do
  session[:id] = nil
end