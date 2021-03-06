Rails.application.routes.draw do
  
  resources :bags do
    resources :tools #, only: [:create, :destroy]
  end

  resources :tools do
    resources :essentials, only: [:create, :destroy]
  end

  resources :essentials, only: [:create, :destroy, :index]
  
  devise_for :admins

  devise_for :users, path: 'auth', controllers: { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' } 

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy'
  end

  get 'welcome/index'
  # post 'bags/new'

  root 'welcome#index'
end
