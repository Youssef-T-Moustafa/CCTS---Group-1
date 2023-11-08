# config/routes.rb
Rails.application.routes.draw do
  resources :club_members
  resources :attendances
  resources :extra_activities
  devise_for :students
  devise_for :staffs
  resources :clubs
  resources :activities
  get 'home/index'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
end

