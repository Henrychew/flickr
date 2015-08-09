
class Uploader < CarrierWave::Uploader::Base
  
  include CarrierWave::MiniMagick
  
# ORIGINAL PHOTO
  storage :file
  process :resize_to_fill => [800,800]

# THUMB VERSION
  version :thumb do
    process :resize_to_fill => [200,200]
  end

# STORE THE PICTURE UNDER SPECIFIED PIC TO AVOID SAVING PHOTOS WITH SAME NAME
  def store_dir
  	# "uploads/photo/file/photo_id"
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end