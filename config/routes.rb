Rails.application.routes.draw do
	resources :posts
	post '/posts/twilio_create' => 'posts#twilio_create'
	get '/posts/twilio_create' => 'posts#twilio_create'
 
  
  #receive_text'
  resources :smsmsgs
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
