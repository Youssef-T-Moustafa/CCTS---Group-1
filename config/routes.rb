# config/routes.rb
Rails.application.routes.draw do
  resources :staffs
  get 'home/index'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
end
