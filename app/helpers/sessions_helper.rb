module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remeber_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt_token(remember_token))
    self.current_user = user
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.encrypt_token(User.new_remeber_token))
    cookies.delete(:remember_token)
    current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt_token(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def is_admin?(user)
    if user
      user.role == "admin"
    else
      false
    end
  end

  def redirect_back_or(default)
    redirect_to( session[:redirect_location] || default )
    session.delete(:redirect_location)
  end

  def store_location
    session[:redirect_location] = request.url if request.get?
  end

end