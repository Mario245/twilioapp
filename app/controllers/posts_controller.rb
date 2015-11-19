require 'twilio-ruby'
class PostsController < ApplicationController
    include Webhookable
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_filter :set_header

 


  # GET /posts
  # GET /posts.json
 

    def receive_text
      @post = Post.new(:body => params["Body"], :from => params["From"], :to => params["To"])
      response = Twilio::TwiML::Response.new do |r|
        r.Message 'Your Text has been received'
    end  
      render_twiml response
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
