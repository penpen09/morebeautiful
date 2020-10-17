Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :events do
   post :confirm, on: :collection
   resources :comments
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to:'top#index'
  resources :users do
    member do
      get :followers, :following
    end
  end
  resources :eventrooms, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :labels
  # get 'search', to: 'events#search'
end
