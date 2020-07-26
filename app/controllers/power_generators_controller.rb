# frozen_string_literal: true

class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = power_generator_by_filter
  end

  private

  def power_generator_by_filter
    power_generators = PowerGenerator

    if params[:manufacturer].present?
      power_generators = power_generators.where(manufacturer: params[:manufacturer])
    end

    if params[:description].present?
      description_query = params[:description].split(' ').join('%')
      power_generators = power_generators.where('description like ?', "%#{description_query}%")
    end

    if params[:structure].present?
      power_generators = power_generators.where(structure_type: params[:structure])
    end

    if params[:order_by].present?
      power_generators = power_generators.order(Hash[params[:order_by], :asc])
    else
      power_generators = power_generators.order(name: :asc, price: :asc)
    end

    power_generators.page(params[:page]).per(6)
  end
end
