Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  namespace :profile do
    resource :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
