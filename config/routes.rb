Rails.application.routes.draw do
  root to: 'power_generators#index'
  namespace :api do
    namespace :v1 do
      match '/freight_calculator', to: 'freight_calculator#show', via: :post
    end
  end
end
