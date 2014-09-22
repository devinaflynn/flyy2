class AppsController < ApplicationController
  before_action :set_app, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.order(created_at: :desc).all
  end

  def mobile
    @apps = App.mobile.all
    render :index
  end

  def websites
    @apps = App.websites.all
    render :index
  end

  def products
    @apps = App.products.all
    render :index
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find(params[:id])
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
    client = YouTubeIt::Client.new(username:ENV["YOUTUBE_LOGIN"], password:ENV["YOUTUBE_PASSWORD"], dev_key: ENV["YOUTUBE_API_KEY"])
    @upload_info = client.upload_token({title:@app.name, description:@app.tagline, category: "Tech", keywords:["flyy",@app.name]}, app_youtube_callback_url(:app_id=>@app.id))
  end

  def youtube_callback
    @app = App.find(params[:app_id])
    if @app
      @app.youtube_id=params[:id]
      @app.save
      redirect_to @app
    else
      redirect_to root_path
    end
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = current_user.apps.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to edit_app_path(@app), notice: 'Now you can upload the video...' }
        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
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

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      begin
        @app = current_user.apps.find(params[:id])
      rescue
        redirect_to root_path 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :tagline, :website,:logo,:category)
    end

   
end
