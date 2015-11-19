require 'twilio-ruby'
class PostsController < ApplicationController
    include Webhookable
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  

  after_filter :set_header

  skip_before_action :verify_authenticity_token


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

    def receive_text
      @post = Post.new(:body => params["Body"], :from => params["From"], :to => params["To"])
      @post.save

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message 'Your Text has been received '
    end  

    twiml.text
  end


  def send_text
    friends = {
     "+14153334444" => "Curious George",
     "+14155557775" => "Boots",
     "+14155551234" => "Virgil"
    }

    client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
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
