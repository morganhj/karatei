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
end
