# frozen_string_literal: true

module ApplicationHelper
  def enum_options_translated(model, collection, selected = nil)
    collection = model.send(collection).keys.map { |item| [item, t(item, scope: "enum.#{collection}")] }
    options_from_collection_for_select(collection, :first, :last, selected)
  end

  def power_generator_sort_collection
    attributes = %i[name price kwp manufacturer].map do |attr| 
      [attr, t(attr, scope: 'activerecord.attributes.power_generator')]
    end

    options_from_collection_for_select(attributes, :first, :last)
  end
end
