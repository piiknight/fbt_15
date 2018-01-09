class Admin::CategoriesController < Admin::BaseAdminController
  before_action :find_category, only: %i(edit update destroy)

  def index
    @categories = Category.order_desc.page(params[:page]).per_page Settings.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = I18n.t("flash.new_succ")
      redirect_to admin_categories_path
    else
      flash[:danger] = I18n.t("flash.fail")
      render :new
    end
  end

  def edit; end

  def update
    if @category.update category_params
      flash[:success] = I18n.t("flash.update_succ")
      redirect_to admin_categories_path
    else
      flash[:danger] = I18n.t("flash.fail")
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = I18n.t("flash.delete_succ")
    else
      flash[:danger] = I18n.t("flash.fail")
    end
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :address
  end

  def find_category
    @category = Category.find_by id: params[:id]
    redirect_to admin_categories_path if @category.blank?
  end
end
