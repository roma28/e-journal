class SessionsController < ApplicationController

  protect_from_forgery with: :exception

  include SessionsHelper

  def new

  end

  def create
    user = User.find_by(login: params[:session][:login])

    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = "Неверная пара логин-пароль"
      render "new"
    end

  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
