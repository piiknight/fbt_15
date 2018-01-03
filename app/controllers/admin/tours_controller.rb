class Admin::ToursController < Admin::BaseAdminController
  before_action :find_tour, only: %i(edit update destroy)

  def index
    @tours = Tour.order_desc.page(params[:page]).per_page Settings.per_page_admin
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new tour_params
    if @tour.save
      flash[:success] = I18n.t("flash.new_succ")
      redirect_to admin_tours_path
    else
      flash.now[:danger] = I18n.t("flash.fail")
      render :new
    end
  end

  def edit; end

  def update
    if @tour.update tour_params
      flash[:success] = I18n.t("flash.update_succ")
      redirect_to admin_tours_path
    else
      flash[:danger] = I18n.t("flash.fail")
      render :edit
    end
  end

  def destroy
    if @tour.destroy
      flash[:success] = I18n.t("flash.delete_succ")
    else
      flash[:danger] = I18n.t("flash.fail")
    end
    redirect_to admin_tours_path
  end

  private

  def tour_params
    params.require(:tour).permit :name, :address, :price, :time_from, :time_to, :tour_info, :category_id, :image
  end

  def find_tour
    @tour = Tour.find_by id: params[:id]
    redirect_to admin_tours_path if @tour.blank?
  end
end
