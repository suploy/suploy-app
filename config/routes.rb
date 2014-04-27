Suploy::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :apps
  namespace :profiles do
    resources :ssh_keys, except: [:edit, :update]
  end
  root 'apps#index'

  namespace :api do
    resource :session, only: [:create, :destroy]
  end

  scope '/api', defaults: { format: :json } do
    get '/users/profile/me', to: 'profiles#me'
    resources :apps, except: [:new, :edit]
    namespace :users do
      resources :ssh_keys, except: [:new, :edit]
    end
    namespace :admin do
      resources :users, except: [:new, :edit]
      resources :roles, except: [:new, :edit]
    end
  end

end
