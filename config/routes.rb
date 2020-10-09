Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :events do
   post :confirm, on: :collection
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # root to:"event#index"
end
