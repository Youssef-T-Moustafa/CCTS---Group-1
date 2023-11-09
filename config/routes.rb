# config/routes.rb
Rails.application.routes.draw do
  resources :students
  resources :staffs
  resources :club_members
  resources :attendances
  resources :extra_activities
  resources :clubs
  resources :activities
  get 'home/index'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
end

