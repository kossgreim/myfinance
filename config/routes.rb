Rails.application.routes.draw do
  resources :accounts
  get 'dashboard', to: 'main#dashboard'

  authenticated :user do
    root :to => "main#dashboard"
  end

  get 'index', to: 'page#index'

  get 'about', to: 'page#about'

  root to: 'page#index', as: :homepage

  devise_for :users
end
