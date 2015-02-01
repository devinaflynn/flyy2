class StartupsController < ApplicationController
  before_action :set_app, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:index, :websites, :viewed, :popular, :mobile, :products ]

  # GET /startups
  # GET /startups.json
  def index
    @apps = current_user.apps.paginate(page: params[:page], per_page: 2).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def viewed
    @apps = App.all.by_view_count.paginate(page: params[:page], per_page: 10)
    render :index
  end

  def popular
    @apps = App.all.by_vote_count.paginate(page: params[:page], per_page: 10)
    render :index
  end


  def mobile
    @apps = App.mobile.paginate(page: params[:page], per_page: 10)
    render :index
  end

  def websites
    @apps = App.websites.paginate(page: params[:page], per_page: 10)
    render :index
  end

  def products
    @apps = App.products.paginate(page: params[:page], per_page: 10)
    render :index
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    @app = App.where(slug: params[:slug]).first
    if @app == nil
      render plain: "404 Not Found", status: 404
    else
      @comments = @app.comments.order(created_at: :desc)
    end

  end

  # GET /startups/new
  def new
    @app = App.new
  end

  # GET /startups/1/edit
  def edit
    client = YouTubeIt::Client.new(username:ENV["YOUTUBE_LOGIN"], password:ENV["YOUTUBE_PASSWORD"], dev_key: ENV["YOUTUBE_API_KEY"])
    @upload_info = client.upload_token({title:@app.name, description:@app.tagline, category: "Tech", keywords:["flyy",@app.name]}, startup_youtube_callback_url(:startup_id=>@app.slug))
  end

  def youtube_callback
    @app = App.where(slug: params[:startup_id]).first
    if @app
      @app.youtube_id=params[:id]
      @app.save
      redirect_to startup_path(@app.slug)
    else
      redirect_to root_path
    end
  end

  # POST /startups
  # POST /startups.json
  def create
    @app = current_user.apps.build(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to edit_startup_path(@app.slug), notice: 'Now you can upload the video...' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /startups/1
  # PATCH/PUT /startups/1.json
  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
        format.json { render :show, status: :ok, location: @app }
      else
        format.html { render :edit }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to startups_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      begin
        @app = current_user.apps.where(slug: params[:id]).first
      rescue
        redirect_to root_path 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :tagline, :founders, :website,:logo,:category)
    end

    def set_comment
      @comment = Comment.new
    end

   
end
