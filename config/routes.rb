# frozen_string_literal: true

Rails.application.routes.draw do
  defaults format: :json do
    namespace :api, constraints: ->(req) { req.format == :json } do
      namespace :v1 do
        resources :products
      end
    end
  end
end
