Rails.application.routes.draw do
  root 'customers#index'
  resources :customers
  resources :items
  get 'search', to: 'customers#search'
  get 'items-search', to: 'items#search'
end
