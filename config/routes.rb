# config/routes.rb

Rails.application.routes.draw do
  resources :club_advisors
  resources :clubs_advisors
  resources :students
  resources :staffs do
    collection do
      get 'studentsList', to: 'staffs#studentsList'
    end

    member do
      get 'stuInfo/:id', to: 'staffs#stuInfo', as: 'stuInfo' 
    end
  end
  resources :club_members
  resources :attendances
  resources :extra_activities

  resources :clubs do
    resources :activities, only: [:new, :create]
    collection do
      get 'displayactivity'
      #This means, if the clubs/xx equals to one of the gets below, lead to the to: page
      get 'finance', to: 'clubs#finance'
      get 'editBudget', to: 'clubs#editBudget'
      get 'generate_report', to: 'clubs#generate_report', format: :csv
    end
  end

  resources :activities do
    collection do
      get 'editBudget'
      get 'displayactivity'
    end
  end

  get '/clubs/show_students/:staff_id/:club_id', to: 'clubs#show_students', as: :show_students

  get 'clubs/finance'
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check

  get 'activities/createActivity', to: 'activities#createActivity', as: 'createActivity'
  

end
