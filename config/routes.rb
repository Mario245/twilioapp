Rails.application.routes.draw do
  resources :smsmsgs
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
