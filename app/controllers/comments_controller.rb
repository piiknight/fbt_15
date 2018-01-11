class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :find_tour
  before_action :find_review
  before_action :find_comment, except: :create

  def create
    @comment = @review.comments.build comment_params
    if @comment.save
      flash[:success] = I18n.t("flash.new_succ")
      respond_to do |format|
        format.html{redirect_to tour_review_path(@tour, @review)}
        format.js
      end
    else
      flash[:danger] = I18n.t("flash.fail")
      redirect_to_tour_path
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = I18n.t("flash.delete_succ")
    else
      flash[:danger] = I18n.t("flash.fail")
    end
    redirect_to_tour_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge!(user_id: current_user.id)
  end

  def find_tour
    @tour = Tour.find_by id: params[:tour_id]
    return if @tour.present?
    flash[:danger] = I18n.t("flash.tour_not_found")
    redirect_to_tour_path
  end

  def find_review
    @review = Review.find_by id: params[:review_id]
    return if @review.present?
    flash[:danger] = I18n.t("flash.not_found")
    redirect_to_tour_path
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment.present?
    flash[:danger] = I18n.t("flash.not_found")
    redirect_to_tour_path
  end
end
