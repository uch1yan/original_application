Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "homes#index"
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :homes, only: %i[ index ]
  resources :users, only: %i[ show edit update destroy ]
  resources :posts
  resources :growth_records
  resources :kids
  resources :vaccination_records 
  resources :kid_vaccination_records
  resources :families
  
  resources :schedules do
    collection do
      get 'search'
    end
  end
  
  resources :daily_conditions do
    resources :comments
  end
end
