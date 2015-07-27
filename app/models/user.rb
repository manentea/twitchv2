class User < ActiveRecord::Base
  has_secure_password

  has_many :messages

  def self.online_users
    User.where(status: true)
  end
end
