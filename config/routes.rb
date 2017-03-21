Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'chads#index'
  resources :missions, only: [:index]
  resources :contacts, only: [:new, :create]
  resources :actions, only: [:index]
  resources :trails, only: [:index]
  resources :members, only: [:index]
  resources :kisei do
    resources :users, only: [:index]
  end
  get '/actions/sports', to: 'sports#index'
  get '/actions/educations', to: 'educations#index'
end
 