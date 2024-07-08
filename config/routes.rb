Rails.application.routes.draw do
  get 'main/index'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :documents, only: [:index, :new, :create, :show]
end
