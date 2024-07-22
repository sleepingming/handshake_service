Rails.application.routes.draw do
  namespace :admin do
    get 'handshakes/index'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :handshakes, only: [:index, :update, :destroy]
  end

  resources :handshakes, only: [:index, :create, :show, :update]
  root 'handshakes#index'
end
