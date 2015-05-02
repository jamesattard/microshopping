Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get 'subastas', to: 'auctions#index', as: 'auctions'
  post 'bid', to: 'bids#new', as: 'new_bid'
  resources :auctions
  root 'home#index'
end
