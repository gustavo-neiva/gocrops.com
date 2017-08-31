Rails.application.routes.draw do
  root to: 'pages#home'
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/profile'
  get 'dashboard/crops'
  get 'dashboard/graph'

  # This route forces user to complete profile after signup
  get 'dashboard/complete', to: 'dashboard#complete', as: 'dashboard_profile_complete'

  ActiveAdmin.routes(self)

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }

  namespace :dashboard do
    resource :profiles, only: [:edit, :update]
  end

#Crops CRUD methods will be accessed via the Dashboard route
  namespace :dashboard do
    resources :crops, except: :index
  end

  namespace :dashboard do
    resources :harvests, only: :destroy
  end

  namespace :dashboard do
    resources :sells, only: :update
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :crops, only: [ :index ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
