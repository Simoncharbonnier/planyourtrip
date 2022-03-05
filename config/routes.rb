Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, only: [:index, :show, :create] do
    member do
      patch :set_place
      patch :book
    end
    resources :subscriptions, only: [:create, :update, :destroy]
    resources :trip_availabilities, only: [:new, :create]
    resources :place_proposals, only: :create
    resources :votes, only: :create
    resources :messages, only: :create
    resources :tasks, only: [:create, :update]
  end

  resources :trip_availabilities, only: [] do
    resources :availabilities, only: [:create, :destroy]
  end
end
