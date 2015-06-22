Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:index, :show, :edit, :update, :new, :create]

  resources :items do
    resources :item_reviews, only: [:new, :create]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
