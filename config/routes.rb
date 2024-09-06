Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "site#index"
  devise_for :users

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create] do
      collection do
        delete :destroy
      end
    end
  end
end