module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title page_title
    base_title = I18n.t "base_title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def increase_stt page_index, per_age, stt
    @stt += 1
    page_index.to_i.zero? ? 1 + stt : 1 + (page_index.to_i - 1) * per_age + stt
  end

  def avatar_default img
    img.blank? ? "default.png" : img
  end

  def day_end_of_month? date
    date == Time.zone.today.end_of_month.day
  end

  def get_day_current
    Time.zone.today.day
  end

  def get_month_current
    Time.zone.today.month
  end
end
