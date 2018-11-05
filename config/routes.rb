Rails.application.routes.draw do
  resources :purchases
  resources :interests
  resources :services
  resources :skills
  resources :reviews
  resources :feeds
  resources :charges

  devise_for :users 

  resources :profiles, except: [:index]
  get '/profile', to: 'profiles#index'
  #get '/profile/:id', to: 'profiles#show'

  get '/landing_page', to: 'landing_pages#home', as: 'landing_page'

  get '/purchase_history', to: 'purchases#index'

  root to: "feeds#home" # For Devise to work, ensure you have defined root_url to *something*.
end
