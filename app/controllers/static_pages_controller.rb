class StaticPagesController < ApplicationController
  def home;  end

  def about; end

  def tours
    @tours = Tour.all.order_desc.page(params[:page]).per_page(Settings.per_page)
    @tours = Tour.search_tour(params[:search]).order_desc.page(params[:page]) if params[:search].present?
  end
end
