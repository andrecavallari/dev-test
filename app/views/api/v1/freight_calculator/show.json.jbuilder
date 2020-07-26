# frozen_string_literal: true

json.zipcode @freight_calc.zipcode
json.address @freight_calc.address
json.complement @freight_calc.complement
json.city @freight_calc.city
json.state @freight_calc.state
json.weight @freight_calc.weight
json.power_generator_price number_to_currency(@power_generator.price)
json.freight_cost number_to_currency(@freight_calc.freight_cost)
json.total_cost number_to_currency(@freight_calc.freight_cost + @power_generator.price)
