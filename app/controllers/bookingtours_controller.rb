class BookingtoursController < ApplicationController
  include BookingtoursHelper
  include UsersHelper

  before_action :find_booking, only: :destroy

  def show
    @bookingtour = Bookingtour.find_by id: params[:id]
    return @bookingtour if @bookingtour.present?
    flash[:danger] = t "booking_tour.not_found"
    redirect_to root_path
  end

  def create
    @tour = Tour.find_by id: params[:tour_id] unless params[:tour_id].nil?
    @bookingtour = @tour.bookingtours.build bookingtour_params
    @bookingtour.user_id = current_user.id unless current_user.nil?
    if @bookingtour.save
      flash[:success] = I18n.t("booking_tour.review")
      redirect_to @bookingtour
    else
      flash[:danger] = t "login.please"
      redirect_to login_path
    end
  end

  def destroy
    @users = User.admin
    if @booking_tour.destroy
      send_mail_to_admin(@users, @booking_tour) if @users.present?
      flash[:success] = I18n.t("booking_tour.delete_succ")
    else
      flash[:danger] = I18n.t("flash.fail")
    end
    redirect_to history_bookings_path
  end

  private

  def bookingtour_params
    params.require(:bookingtour).permit :quantity
  end

  def find_booking
    @booking_tour = Bookingtour.find_by id: params[:id]
    return @booking_tour if @booking_tour.present?
    flash[:danger] = I18n.t("flash.not_found")
    redirect_to history_bookings_path
  end
end
