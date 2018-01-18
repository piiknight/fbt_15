class StaticPagesController < ApplicationController
  def home
    @hot_tours = Tour.hot_tour.page(params[:page]).per_page(Settings.per_page)
  end

  def about; end
end
