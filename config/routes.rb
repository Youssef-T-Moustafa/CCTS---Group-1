Rails.application.routes.draw do
  resources :students
  resources :staffs
  resources :club_members
  resources :attendances
  resources :extra_activities

  resources :clubs do
    collection do
      get 'finance', to: 'clubs#finance'
      get 'editBudget', to: 'clubs#editBudget'
      get 'generate_report', to: 'clubs#generate_report', format: :csv
    end
  end

  resources :activities do
    collection do
      get 'editBudget'
    end
  end

  get 'clubs/finance'
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check

end
