Rails.application.routes.draw do
  get 'kids/new'
  get 'kids/edit'
  get 'kids/show'
  root "daily_conditions#show"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: %i[ show edit ]
  resources :daily_conditions

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
