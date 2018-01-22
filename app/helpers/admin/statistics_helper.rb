module Admin::StatisticsHelper
  def statistic_booking_tour_by_day
    column_chart Bookingtour.group_by_day(@bookingtours), height: Settings.chart.height, library: {
      title: {text: I18n.t("chart.title", month: Time.zone.today.month, year: Time.zone.today.year)},
      yAxis: {
        title: {text: I18n.t("chart.yAxis.title")}
      },
      xAxis: {
        title: {text: I18n.t("chart.xAxis.title")}
      }
    }
  end
end
