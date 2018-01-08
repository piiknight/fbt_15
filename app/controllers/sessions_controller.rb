class SessionsController < ApplicationController
  before_action :set_user, only: :create

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == Settings.User.is_remember_pass ? remember(@user) : forget(@user)
      flash[:success] = t "success_creat"
      redirect_back_or @user
    else
      flash[:danger] = t "error_creat"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find_by email: params[:session][:email].downcase
  end
end
