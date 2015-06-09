class UsersController < ApplicationController

  include SessionsHelper

  before_action :admin_user, only: [:destroy, :index, :update, :edit, :new]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    params[:user][:login] = User.new_login
    password = User.new_password
    params[:user][:password] = password
    params[:user][:password_confirmation] = password
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Пользователь успешно создан"
      flash[:info] = ("Ваш логин: " + params[:user][:login] + "\n" + "Ваш пароль: " + params[:user][:password]).html_safe
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Профиль успешно обновлен"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь успешно удален"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation,
                                 :mother_name, :mother_email, :mother_job, :mother_occupation, :mother_telephone, :mother_education,
                                 :father_name, :father_email, :father_job, :father_occupation, :father_telephone, :father_education,
                                 :name, :adress, :disability, :guardianship, :email, :telephone, :passport, :snils, :inn, :place_of_birth,
                                 :date_of_birth)
  end

  def signed_in_user
    unless signed_in?
      store_location
      flash[:warning] = "Пожалуйста войдите"
      redirect_to signin_path
    end
  end

  def admin_user
    unless is_admin?(current_user)
      store_location
      flash[:warning] = "Только администраторы имеют доступ к этой странице"
      redirect_to signin_path
    end
  end

end
