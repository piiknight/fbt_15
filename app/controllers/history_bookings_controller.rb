class HistoryBookingsController < ApplicationController
  before_action :logged_in_user
  before_action :find_booking_tour

  def index; end

  private

  def find_booking_tour
    @booking_tours = Bookingtour.booking_by_user(current_user.id).order_desc
    return if @booking_tours.present?
    flash[:info] = I18n.t("flash.not_have_booking")
    redirect_to root_path
  end
end
