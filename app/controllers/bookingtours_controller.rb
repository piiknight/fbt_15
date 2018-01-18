class BookingtoursController < ApplicationController
  include BookingtoursHelper

  def show
    @bookingtour = Bookingtour.find_by id: params[:id]
    if @bookingtour.blank?
      flash[:danger] = t "booking_tour.not_found"
      redirect_to root_path
    end
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

  private

  def bookingtour_params
    params.require(:bookingtour).permit :quantity
  end
end
