Rails.application.routes.draw do
  root "users#show"
  resources :checks
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  
  resources :users, only: %i[ show edit update destroy ]
  resources :posts
  resources :growth_records
  resources :kids
  resources :vaccination_records 
  resources :schedules do
    collection do
      get 'search'
    end
  end
  resources :families
  resources :daily_conditions do
    resources :comments
  end
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
