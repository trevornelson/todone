Rails.application.routes.draw do
  root 'home#index'

  namespace :api do

      mount_devise_token_auth_for 'User', at: 'auth'

      resources :tasks, only: [:index, :create, :edit, :destroy]

  end

end
