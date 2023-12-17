# config/routes.rb

Rails.application.routes.draw do
  resources :inventory_histories
  resources :inventories 
  resources :staff_activities
  resources :club_advisors
  resources :clubs_advisors
  resources :students do
    member do
      patch :update_score
    end
  end
  resources :staffs do
    collection do
      get 'studentsList', to: 'staffs#studentsList'
      get 'staffList', to: 'staffs#staffList' # Adding staffList route
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

  

  
  get 'dashboard/generate_report', to: 'dashboard#generate_report', format: :csv, as: 'generate_report_dashboard'
  get '/clubs/show_students/:staff_id/:club_id', to: 'clubs#show_students', as: :show_students
  get 'dashboard/myTable', to: 'dashboards#my_table'
  get 'clubs/finance'
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
  get 'activities/createActivity', to: 'activities#createActivity', as: 'createActivity'
  post '/upload', to: 'activities#upload'
  get 'activities/:id/media' => 'activities#media', as: :activity_media
  get 'attendances/:id/media' => 'attendances#media', as: :attendance_media

  get 'extra_activities/:id/evidence' => 'extra_activities#evidence', as: :extra_activity_evidence



end
