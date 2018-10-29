Rails.application.routes.draw do
  root to: "home#index" # For Devise to work, ensure you have defined root_url to *something*.
end
