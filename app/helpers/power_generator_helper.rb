# frozen_string_literal: true

module PowerGeneratorHelper
  def power_generator_manufacturers_options_for_select(selected = nil)
    manufacturers_list = PowerGenerator.distinct(:manufacturer).pluck(:manufacturer).map do |manufacturer|
      [manufacturer, manufacturer]
    end

    options_from_collection_for_select(manufacturers_list, :first, :last, selected)
  end
end
