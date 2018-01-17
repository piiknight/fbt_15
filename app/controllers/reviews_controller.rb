class ReviewsController < ApplicationController
  before_action :logged_in_user
  before_action :set_history, only: %i(edit destroy)
  before_action :find_tour, except: :index
  before_action :find_review, except: %i(index new create)

  def index
    @user = current_user
    @reviews = Review.load_reviews_by_user @user.id
    return if @reviews.present?
    flash[:info] = I18n.t("flash.empty_review")
    redirect_to root_url
  end

  def new
    @review = Review.new
  end

  def create
    @review = @tour.reviews.build review_params
    if @review.save
      flash[:success] = I18n.t("flash.add_review_suc")
      redirect_to tour_path @tour
    else
      flash.now[:danger] = I18n.t("flash.fail")
      render :new
    end
  end

  def edit; end

  def update
    @history = params[:history]
    if @review.update review_params
      flash[:success] = I18n.t("flash.update_review_suc")
      redirect_to url_old @history
    else
      flash[:danger] = I18n.t("flash.fail")
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = I18n.t("flash.delete_succ")
    else
      flash[:danger] = I18n.t("flash.fail")
    end
    redirect_to url_old @history
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content).merge!(user_id: current_user.id)
  end

  def find_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour.present?
    flash[:info] = I18n.t("flash.tour_not_found")
    redirect_to tour_path
  end

  def find_review
    @review = Review.find_by id: params[:id]
    return if @review.present?
    flash[:info] = I18n.t("flash.not_found")
    redirect_to tour_path
  end

  def set_history
    @history = params[:history]
  end

  def url_old history
    history.blank? ? tour_path(@tour) : tour_reviews_path(current_user)
  end
end
