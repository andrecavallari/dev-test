# frozen_string_literal: true

module ApplicationHelper
  def enum_options_translated(model, collection, selected = nil)
    collection = model.send(collection).keys.map { |item| [item, t(item, scope: "enum.#{collection}")] }
    options_from_collection_for_select(collection, :first, :last, selected)
  end
end
