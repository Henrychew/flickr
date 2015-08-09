# READ- READ
get '/albums' do  #THIS LINK ON LAYOUT (APPLIED TO ALL PAGES)
  @user = User.find(session[:id])
  @albums = @user.albums
  erb :"albums/index"
end


# READ - SHOW
get '/albums/:id' do
  @album = Album.find(params[:id])
  @photos = @album.photos
  erb :'albums/show'
end

#CREATE - CREATE
post '/albums/create' do
  @user = User.find(session[:id])
  @album = @user.albums.new(params[:album])

  if @album.save
    redirect to "/albums/#{@album.id}"
  else
    erb :"albums/index"
  end

end

