Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :drugs, only: [:index, :show]
  resources :pharmas, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :patients, only: [:index, :show]
  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end
end
