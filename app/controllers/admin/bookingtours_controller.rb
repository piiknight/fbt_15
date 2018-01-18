class Admin::BookingtoursController < Admin::BaseAdminController
  include BookingtoursHelper
  before_action :find_booking, except: :index

  def index
    @bookingtours = Bookingtour.order_desc.page(params[:page]).per_page Settings.per_page
  end

  def edit; end

  def update
    @user = @bookingtour.user
    if @bookingtour.update bookingtour_params
      UserMailer.feedback_to_user(@user, @bookingtour).deliver
      flash[:success] = I18n.t("flash.update_succ")
      redirect_to admin_bookingtours_path
    else
      flash[:danger] = I18n.t("flash.not_found")
      render :edit
    end
  end

  def destroy
    if @bookingtour.destroy
      UserMailer.delete_bookingtour(@bookingtour.user).deliver
      flash[:success] = I18n.t("flash.delete_succ")
    else
      flash[:danger] = I18n.t("flash.fail")
    end
    redirect_to admin_bookingtours_path
  end

  private

  def find_booking
    @bookingtour = Bookingtour.find_by id: params[:id]
    return if @bookingtour.present?
    flash[:danger] = I18n.t("flash.not_found")
    redirect_to admin_bookingtours_path
  end

  def bookingtour_params
    params.require(:bookingtour).permit :state
  end
end
