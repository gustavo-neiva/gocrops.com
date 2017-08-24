Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/profile'

  ActiveAdmin.routes(self)

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  namespace :profile do
    resource :users
  end

#Crops CRUD methods will be accessed via the Dashboard route
  namespace :dashboard do
    resources :crops, only: [:new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
