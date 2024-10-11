Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'login', to: 'users#login', as: :login
  # root to: 'users#login'
  # get '/login', to: 'users#login'
  # post '/logon', to: 'users#logon'
  # delete '/logoff', to: 'users#logoff'

  root 'dog_sightings#index'

  resources :cities
  resources :dog_sightings
  resources :users

  # Defines the root path route ("/")
  # root "posts#index"
end
