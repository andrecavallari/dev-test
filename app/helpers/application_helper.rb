module ApplicationHelper
  def manufacturers_options_for_select
    manufacturers_list = PowerGenerator.distinct(:manufacturer).pluck(:manufacturer).map { |m| [m, m] }
    options_from_collection_for_select(manufacturers_list, :first, :last)
  end
end
