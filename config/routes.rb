Suploy::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'}

  resources :apps
  namespace :profiles do
    resources :ssh_keys, except: [:edit, :update]
  end
  root 'apps#index'

  namespace :api, defaults: { format: :json } do
    get '/users/profile/me', to: 'profiles#me'
    resource :session, only: [:create, :destroy]
  end

  scope '/api', defaults: { format: :json } do
    resources :apps, except: [:new, :edit]
    namespace :profiles do
      resources :ssh_keys, except: [:new, :edit]
    end
    namespace :admin do
      resources :users, except: [:new, :edit]
      resources :roles, except: [:new, :edit]
    end
  end

end
