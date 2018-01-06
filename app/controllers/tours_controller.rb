class ToursController < ApplicationController
  def show
    @tour = Tour.find_by id: params[:id]
    if @tour
      @tours_involve = Tour.of_type(@tour.category_id).order_desc
    else
      flash[:danger] = t "flash.tour_not_found"
      redirect_to root_path
    end
  end
end
