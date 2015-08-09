# CREATE NEW PHOTO
post '/albums/:album_id/photos/create' do
  @user = User.find(session[:id])
  @album = Album.find(params[:album_id])
  @photo = @album.photos.new(params[:photo])
  @photo.user = @user

  if @photo.save
    redirect to "/photos/#{@photo.id}"
  else
    redirect to "/albums/#{@album.id}"
  end

end


# STEPS:

# 1. gemfile
# 2. config/environ.rb
# 3. Uploader/uploader.rb  -- class Uploader
# 4. app/model/photo.rb --  mount_uploader :file, Uploader 
# 5. album/show.erb -- <form action="/albums/<%= @album.id %>/photos/create" method="post" enctype="multipart/form-data">


# READ SHOW PHOTO
get '/photos/:id' do
  @photo = Photo.find(params[:id])
  @album = @photo.album
  erb :"photos/show"
end