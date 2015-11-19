Rails.application.routes.draw do
	post '/posts/receive_text' => 'posts#receive_text'
	get '/posts/receive_text' => 'posts#receive_text'
  resources :posts
  
  #receive_text'
  resources :smsmsgs
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
