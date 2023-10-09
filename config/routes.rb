Rails.application.routes.draw do
  
  root "home#index"
  resources :github_repository, only: [:index]
end
