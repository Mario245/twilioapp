Rails.application.routes.draw do
  resources :sms
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
