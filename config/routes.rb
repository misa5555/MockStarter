BigStart::Application.routes.draw do
  root to: "projects#index"
  resources :users
  resource :session
  post '/guest_login', to: 'sessions#guest_login', as: 'guest_login'
  delete '/session', to: 'session#desrtoy', as: 'logout'
  
  resources :projects do
    resources :backs, only: [:new, :create, :edit, :update]
  end
  get '/discover', to: 'projects#discover'

  namespace :api, defaults: { format: :json } do
    resources :projects, only: [:show]
    get 'search', to: 'projects#search', as: 'search'
    resources :comments, only: [:create, :destroy]
    
  end
end
