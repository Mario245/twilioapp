require 'twilio-ruby'
class PostsController < ApplicationController
    include Webhookable
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_filter :set_header

 


  # GET /posts
  # GET /posts.json
 

    def receive_text
      #@post = Post.new(:body => params["Body"], :from => params["From"], :to => params["To"])
      
      client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
      message = client.messages.create from: '3475779547', to: '3472795257', body: 'Learning to send SMS you are.'
      render plain: message.status
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
