class MsgsController < ApplicationController
  before_action :set_msg, only: [:show, :edit, :update, :destroy]


  def twilio_create
  
    @msg = Msg.new(:body => params["Body"], :from => params["From"], :to => params["To"])
    @msg.save
    
    response = Twilio::TwiML::Response.new do |r|
      r.Message 'Your Text has been received '

      redirect_to :action => 'tenants/create'
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
