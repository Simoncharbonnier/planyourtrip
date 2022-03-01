Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:index, :show, :create, :update] do
    resources :subscriptions, only: [:create, :update, :destroy]
    resources :availabilities, only: :create
    resources :place_proposals, only: :create
    resources :votes, only: :create
    resources :messages, only: :create
    resources :tasks, only: [:create, :update]
  end
end
