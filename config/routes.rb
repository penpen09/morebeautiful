Rails.application.routes.draw do
  resources :events do
   post :confirm, on: :collection
  end
end
