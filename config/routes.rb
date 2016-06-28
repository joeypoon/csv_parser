Rails.application.routes.draw do
  root 'customers#index'
  resources :customers, only: [:create, :new]
end
