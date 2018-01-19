class Admin::StatisticsController < Admin::BaseAdminController
  include ApplicationHelper

  def index
    @users = User.admin
    @bookingtours = Bookingtour.of_month_currenty get_month_current
    UserMailer.statistic_per_month(@users).deliver if @users.present? && day_end_of_month?(get_day_current)
  end
end
