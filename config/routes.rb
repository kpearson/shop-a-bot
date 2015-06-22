Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :show, :edit, :update, :new, :create]

  resources :items do
    resources :item_reviews, only: [:new, :create]
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
