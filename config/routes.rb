# config/routes.rb
Rails.application.routes.draw do
  resources :students
  resources :staffs
  resources :club_members
  resources :attendances
  resources :extra_activities
<<<<<<< HEAD
  devise_for :students
  devise_for :staffs
  resources :clubs do
    collection do
      get 'finance', to: 'clubs#finance'
      get 'editBudget', to: 'clubs#editBudget'
    end
  end
=======
  resources :clubs
>>>>>>> f7130bda5fb06f548d460733705443038ed2b741
  resources :activities
  get 'home/index'
  get 'clubs/finance'
  root 'home#index'
  get "up" => "rails/health#show", as: :rails_health_check
end

