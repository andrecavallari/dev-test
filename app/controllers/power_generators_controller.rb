class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = power_generator_by_filter
  end

  private

  def power_generator_by_filter
    power_generators = PowerGenerator.order(price: :asc, name: :asc)

    if params[:manufacturer].present?
      power_generators = power_generators.where(manufacturer: params[:manufacturer])
    end

    if params[:description].present?
      description_query = params[:description].split(' ').join('%')
      power_generators = power_generators.where('description like ?', "%#{description_query}%")
    end

    power_generators.order(price: :asc, name: :asc).page(params[:page]).per(6)
  end
end
