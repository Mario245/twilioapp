
require 'twilio-ruby'
class MsgsController < ApplicationController
   skip_before_action :verify_authenticity_token


 def new
  @msg = Msg.new
  redirect_to action: :twilio_create
 end

  def twilio_create
  
    @msg = Msg.new(:body => params["Body"], :from => params["From"], :to => params["To"])
    @msg.save
    
    response = Twilio::TwiML::Response.new do |r|
      r.Message 'Your Text has been received '

    end
    end 

  # PATCH/PUT /msgs/1
  # PATCH/PUT /msgs/1.json

 


  private
 

    # Never trust parameters from the scary internet, only allow the white list through.
    def msg_params
      params.require(:msg).permit(:to, :from, :body)
    end
end
