class User < ActiveRecord::Base
  validates :username, presence: true,
            length: {maximum: 50}, uniqueness: true
  validates :password, presence: true,
            length: {minimum: 6, maximum: 50}

  before_save {self.username.downcase!}
  has_secure_password

end
