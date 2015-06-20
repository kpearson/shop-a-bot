Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :show, :edit, :update, :new, :create]
end
