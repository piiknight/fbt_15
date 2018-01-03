class Admin::UsersController < Admin::BaseAdminController
  before_action :find_user, only: %i(edit update destroy)

  def index
    @users = User.order_desc.page(params[:page]).per_page Settings.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = I18n.t("flash.new_succ")
      redirect_to admin_users_path
    else
      flash[:danger] = I18n.t("flash.fail")
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = I18n.t("flash.update_succ")
      redirect_to admin_users_path
    else
      flash[:danger] = I18n.t("flash.fail")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = I18n.t("flash.delete_succ")
    else
      flash[:success] = I18n.t("flash.fail")
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :address, :role, :sdt, :email, :password,
      :password_confirmation, :avatar
  end

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to admin_users_path if @user.blank?
  end
end
