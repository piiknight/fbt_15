class ToursController < ApplicationController
  include ToursHelper
  before_action :find_tour, only: :show

  def index
    @tours = Tour.all.order_desc.page(params[:page]).per_page(Settings.per_page)
    @tours = Tour.search_tour(params[:search]).order_desc.page(params[:page]) if params[:search].present?
    @tours_cat = Tour.of_type(params[:category]) if params[:category].present?
    return unless request.xhr?
    respond_to do |format|
      format.html{render @tours_cat}
      format.js
    end
  end

  def show
    @reviews = Review.load_reviews_by_tour @tour.id
    @avg_rating = avg_rating @reviews

    if @tour
      @tours_involve = Tour.of_type(@tour.category_id).order_desc
    else
      flash[:danger] = t "flash.tour_not_found"
      redirect_to root_path
    end
  end

  private

  def find_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour.present?
    flash[:info] = I18n.t("flash.tour_not_found")
    redirect_to root_path
  end
end
