Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/crops'
  get 'dashboard/profile'

  ActiveAdmin.routes(self)

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  namespace :dashboard do
    resource :profiles, only: [:edit, :update]
      # Farm is related to user
      get '/farms/edit', to: 'users#edit_farm'
      put '/farms', to: 'users#update_farm'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
