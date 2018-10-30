Rails.application.routes.draw do

  root 'application#index'
  resources :categories do
    resources :recommendations, only: [:index]
    get '/recent' => 'recommendations#recent'
  end

  get '/recommendations/recent' => 'recommendations#recent'

  resources :recommendations do
    resources :comments
  end
  resources :users do
    resources :comments, only: [:index]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/failure', to: redirect('/')
  delete '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
