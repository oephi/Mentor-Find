Rails.application.routes.draw do
  resources :purchases
  resources :interests
  resources :services
  resources :skills
  resources :reviews
  resources :feeds
  devise_for :users

  #get '/profile', to: 'feeds#show', as: 'profile'
  get '/profile', to: 'services#profile'
  get '/purchase_history', to: 'services#purchase_history'

  root to: "feeds#home" # For Devise to work, ensure you have defined root_url to *something*.
end
