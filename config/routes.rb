Rails.application.routes.draw do
  get 'lists/update'
  get 'users/show'
  resources :collections do 
    resources :sources
  end
  devise_for :users
  resources :users, only: [:show]
  resources :lists, only: [:update]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # API for fetching venues from front-end!
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sources, only: [:index]
    end
  end
end
