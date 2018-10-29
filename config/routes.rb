Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" # For Devise to work, ensure you have defined root_url to *something*.
end
