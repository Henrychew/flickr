
class User < ActiveRecord::Base
  has_many :albums
  has_many :photos

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(hash)
    @user = User.find_by(username: hash[:username])
    
    if @user && @user.password == hash[:password]
      @user
    else
      nil
    end
  
  end

end
