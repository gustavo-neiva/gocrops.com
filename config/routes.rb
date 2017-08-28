Rails.application.routes.draw do
  root to: 'pages#home'
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/profile'
  get 'dashboard/crops'

  ActiveAdmin.routes(self)

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :dashboard do
    resource :farms, only: [:edit, :update]
    resource :profiles, only: [:edit, :update]
      # Farm is related to user
      #get '/farms/edit', to: 'profiles#edit_farm'
      #put '/farms', to: 'profiles#update_farm'
  end

#Crops CRUD methods will be accessed via the Dashboard route
  namespace :dashboard do
    resources :crops, except: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
