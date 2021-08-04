Rails.application.routes.draw do
  resources :listings
  root 'home#page'
end
