Rails.application.routes.draw do
  root "users#show"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: %i[ show edit update ]
  resources :kids
  resources :daily_conditions do
    resources :comments
  end
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
