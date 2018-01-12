class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "login.please"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user? @user
  end

  def redirect_to_tour_path
    redirect_to tour_path @tour
  end

  def authencation_admin!
    return if current_user.is_admin?
    flash[:danger] = I18n.t("role.not_admin")
    redirect_to root_url
  end
end
