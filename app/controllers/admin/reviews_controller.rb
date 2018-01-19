module Admin
  class ReviewsController < Admin::BaseAdminController
    before_action :find_review, only: :destroy

    def index
      @tours = Tour.all
      @reviews = Review.load_reviews_by_tour(params[:tour_id]).page(params[:page]).per_page Settings.per_page
    end

    def destroy
      if @review.destroy
        flash[:success] = I18n.t("flash.delete_succ")
      else
        flash[:danger] = I18n.t("flash.fail")
      end
      redirect_to admin_reviews_path
    end

    private

    def find_review
      @review = Review.find_by id: params[:id]
      return if @review.present?
      flash[:danger] = I18n.t(flash.not_found)
      redirect_to admin_reviews_path
    end
  end
end
