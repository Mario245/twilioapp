Rails.application.routes.draw do
	post '/messages/twilio_create' => 'messages#twilio_create'
	get '/messages/twilio_create' => 'messages#twilio_create'

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
