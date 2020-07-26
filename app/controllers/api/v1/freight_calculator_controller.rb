# frozen_string_literal: true

module Api
  module V1
    class FreightCalculatorController < ApplicationController
      rescue_from 'FreightCalculator::NotFoundError' do |exception|
        render json: exception, status: 404
      end

      def show
        return render json: params
        @power_generator = PowerGenerator.find(params[:power_generator_id])
        @freight_calc = ::FreightCalculator.cost(params[:zipcode], @power_generator.weight)
      end
    end
  end
end
