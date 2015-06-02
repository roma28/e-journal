class User < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 50 }
  validates :login, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  before_save { self.login = login.downcase }
  has_secure_password
  
end
