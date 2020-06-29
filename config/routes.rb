Rails.application.routes.draw do
  get 'users/show'
  resources :collections do 
    resources :sources
  end
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
