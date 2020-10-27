Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :events do
   # post :confirm, on: :collection
   resources :comments
   get :event_index, on: :member
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to:'top#index'
  # get '/users/eventrooms/:id', to: 'users#eventrooms'
  resources :users do
    member do
      get :followers, :following, :eventrooms, :event_index
    end
  end
  resources :eventrooms, only: [:index, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :labels
  # get 'search', to: 'events#search'
  resources :inquiries
  resources :conversations do
    resources :messages
  end
  resources :posts
end
