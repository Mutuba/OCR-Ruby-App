Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
  }
  
  get "up" => "rails/health#show", as: :rails_health_check

  root 'documents#index'

  resources :documents, only: [:index, :new, :create, :show]
end
