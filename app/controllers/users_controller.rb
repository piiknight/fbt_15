class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(edit update)
  before_action :correct_user, only: %i(edit update)
  before_action :load_user, only: %i(edit update show)

  def show
    return if @user
    flash[:danger] = t "error_sign_up"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "signup.success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "user.update"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :sdt, :address,
      :avatar, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    redirect_to root_path if @user.blank?
  end
end
