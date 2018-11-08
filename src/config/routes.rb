Rails.application.routes.draw do
  resources :purchases
  resources :interests
  resources :services
  resources :skills
  resources :reviews
  resources :feeds
  resources :charges
  resources :profiles

  devise_for :users

  get '/profile', to: 'profiles#show'
  get '/landing_page', to: 'landing_pages#home'

  root to: "feeds#home", feed: {interest: "all"} # For Devise to work, ensure you have defined root_url to *something*.
end