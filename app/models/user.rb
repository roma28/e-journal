class User < ActiveRecord::Base

  validates :name, presence: true
  validates :login, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  validates :mother_name, presence: true
  validates :mother_telephone, presence: true
  validates :mother_email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true

  validates :father_name, presence: true
  validates :father_telephone, presence: true
  validates :father_email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, allow_blank: true

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
