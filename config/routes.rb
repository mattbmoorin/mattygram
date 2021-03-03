Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks', sessions: 'sessions' }
  
  resources :accounts, only: [:show]
  resources :posts, only: [:new, :create, :show] do
    resources :likes
  end
  
  get '/dashboard' => 'accounts#index'
  get '/profile/:username' => 'accounts#show', as: :profile

  # would need to change to post request in production to protect against webcrawlers
  get '/post/like/:post_id' => 'likes#save_like', as: :like_post

  root to: 'public#index'
end