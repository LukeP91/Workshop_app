Rails.application.routes.draw do
  # get 'users/show'

  devise_for :users
    resources :categories do
      resources :products do
        resources :reviews
      end
    end
  resources :users
  root 'categories#index'
end
