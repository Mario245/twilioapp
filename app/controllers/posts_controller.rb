require 'twilio-ruby'
class PostsController < ApplicationController
    include Webhookable
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_filter :set_header

 


  # GET /posts
  # GET /posts.json
 

    def twilio_create
      #@post = Post.new(:body => params["Body"], :from => params["From"], :to => params["To"])
      
      @client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token
      message = client.messages.create(from: '+13472795257', to: '+13475779547', body: 'Thanks for your message.')
      #render plain: message.status
  
    @post = Post.new(:body => params['body'], :from => params['from'], :to => params['to'])
    @post.save

   

   
  end


  



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:to, :from, :body)
    end
end
