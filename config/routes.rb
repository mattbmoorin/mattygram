Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  
  resources :accounts
  resources :posts, only: [:new, :create, :show]
  get '/dashboard' => 'accounts#index'
  
  root to: 'public#index'
end

#devise_for :accounts
# devise_scope :account do
#   get 'accounts/sign_in', to: 'accounts/sessions#new', as: :new_accounts_session
#   get 'accounts/sign_out', to: 'accounts/sessions#destroy', as: :destroy_accounts_session
# end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html