Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks', sessions: 'sessions' }
  
  resources :accounts, only: [:show]
  resources :posts, only: [:new, :create, :show]
  
  get '/dashboard' => 'accounts#index'
  get '/profile/:username' => 'accounts#show', as: :profile

  root to: 'public#index'
end