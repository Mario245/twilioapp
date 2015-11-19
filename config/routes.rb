Rails.application.routes.draw do
	 resources :posts
	post '/posts/receive_text' => 'posts#receive_text'
	get '/posts/receive_text' => 'posts#receive_text'
 
  
  #receive_text'
  resources :smsmsgs
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
