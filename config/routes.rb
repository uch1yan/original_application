Rails.application.routes.draw do
  root "homes#index"
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :homes, only: %i[ index ]
  resources :users, only: %i[ show edit update destroy ]
  resources :posts
  resources :growth_records
  resources :kids
  resources :vaccination_records 
  resources :kid_vaccination_records
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
