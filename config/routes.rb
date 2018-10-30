Rails.application.routes.draw do
  resources :purchases
  resources :interests
  resources :services
  resources :skills
  resources :reviews
  devise_for :users
  root to: "home#index" # For Devise to work, ensure you have defined root_url to *something*.
end
