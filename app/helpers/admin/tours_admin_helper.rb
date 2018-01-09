module Admin::ToursAdminHelper
  def category_for_select
    Category.all.collect{|c| [c.address, c.id]}
  end
end
