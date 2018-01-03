class StaticPagesController < ApplicationController
  def home; end

  def about; end

  def tours
    @tours = Tour.all.order_desc.page(params[:page]).per_page(Settings.per_page)
  end
end
