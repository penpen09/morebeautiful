Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :events do
   post :confirm, on: :collection
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to:'events#index'
  resources :users
  resources :eventrooms, only: [:create, :destroy]
end
