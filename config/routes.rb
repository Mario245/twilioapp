Rails.application.routes.draw do
 
	post '/tenants/receive_text' => 'tenants#receive_text'
  get '/tenants/receive_text' => 'tenants#receive_text'
	get '/msgs/twilio_create' => 'messages#twilio_create'
  resources :tenants
  resources :msgs

  resources :messages
	post '/posts/twilio_create' => 'posts#twilio_create'
	get '/posts/twilio_create' => 'posts#twilio_create'
 	resources :posts
  
  #receive_text'
  resources :smsmsgs
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
