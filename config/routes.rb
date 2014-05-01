require 'sidekiq/web'

Suploy::Application.routes.draw do

  # Main App
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'}

  resources :apps

  namespace :profiles do
    resources :ssh_keys, except: [:edit, :update]
  end

  constraint = lambda { |request| request.env["warden"].authenticate? and request.env['warden'].user.admin? }
  constraints constraint do
    mount Sidekiq::Web, at: "/admin/sidekiq", as: :sidekiq
  end

  namespace :admin do
    resources :dashboard, only: :index
    resources :background_jobs, only: :index
    get '/', to: 'dashboard#index'
    resources :users
  end

  root 'apps#index'

  # API
  namespace :api, defaults: { format: :json } do
    get '/users/profile/me', to: 'profiles#me'
    resource :session, only: [:create, :destroy]
  end

  scope '/api', defaults: { format: :json } do
    resources :apps, except: [:new, :edit]
    namespace :profiles do
      resources :ssh_keys, except: [:new, :edit]
    end
  end

end
