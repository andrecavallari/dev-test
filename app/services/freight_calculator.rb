# frozen_string_literal: true

class FreightCalculator
  include HTTParty
  base_uri 'https://viacep.com.br/ws'

  class NotFoundError < HTTParty::Error; end
  class UnknownError < HTTParty::Error; end

  class << self
    def cost(zipcode, weight)
      zipcode_info = zipcode_info(zipcode)
      freight_data = freight_info(zipcode_info['uf'], weight)
      cost_response(zipcode_info, freight_data, weight)
    end

    private

    def zipcode_info(zipcode)
      response = get("/#{zipcode}/json")
      if response['erro'].present? || [400, 404].include?(response.code)
        raise NotFoundError.new('Zipcode not found')
      elsif response.code != 200
        raise UnknownError.new('Unknown error')
      else
        response
      end
    end

    def freight_info(state, weight)
      Freight.where('lower(state) = lower(?)', state).where('weight_min <= ?', weight)
        .where('weight_max >= ?', weight).first
    end

    def cost_response(zipcode_info, freight_data, weight)
      OpenStruct.new({ zipcode: zipcode_info['cep'], address: zipcode_info['logradouro'],
        complement: zipcode_info['complemento'], city: zipcode_info['localidade'], state: zipcode_info['uf'], 
        weight: weight, freight_cost: freight_data['cost'] })
    end
  end
end
