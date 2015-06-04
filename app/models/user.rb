class User < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 50 }
  validates :login, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  before_save { self.login = login.downcase }
  before_create :create_remember_token
  has_secure_password

  def User.new_remeber_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt_token(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.new_remeber_token
  end

end
