
class Photo < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :album
  
  #to upload pic
  mount_uploader :file, Uploader 

end
