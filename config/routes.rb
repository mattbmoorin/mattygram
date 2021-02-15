Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  
  resources :accounts
  resources :posts, only: [:new, :create, :show]
  get '/dashboard' => 'accounts#index'
  
  root to: 'public#index'
end