Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get 'subastas', to: 'auctions#index', as: 'auctions'
  resources :auctions
  root 'home#index'
end
