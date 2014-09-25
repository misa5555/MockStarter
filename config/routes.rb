BigStart::Application.routes.draw do
  root to: "static_pages#root"
  resources :users
  resource :session
  delete '/session', to: 'session#desrtoy', as: 'logout'
  resources :projects do
    resources :backs, only: [:new, :create]
    get '/backers', to: 'projects#backer_index'
  end

  namespace :api, defaults: { format: :json } do
    resources :projects
  end
end
