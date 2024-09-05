Rails.application.routes.draw do
  resources :posts, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "site#index"
  devise_for :users
end