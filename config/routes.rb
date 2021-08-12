Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  resources :listings
  root 'home#page'
  get '/about', to: 'home#about'
  get '/my_listings', to: 'home#my_listings'
end
