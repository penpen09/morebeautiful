Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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
      get :followers, :following, :eventrooms, :event_index, :post_index, :favorites
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
  resources :posts do
    resources :comments
    get :post_index, on: :member
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  get '/authorize' => 'auth#gettoken'
  get '/feedbacks', to: 'feedbacks#new'
  post '/feedbacks', to: 'feedbacks#create'
  resources :feedbacks
  resources :notifications, only: :index
end
