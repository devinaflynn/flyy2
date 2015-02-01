class VideoUpdatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_startup
  before_action :set_video_update, only: [:edit,:update]

  def new
    @video_update = @startup.video_updates.new
  end

  def create
    @video_update = @startup.video_updates.new(video_update_params)

    respond_to do |format|
      if @video_update.save
        format.html { redirect_to edit_startup_video_update_path(:startup_id=>@startup.id,:id=>@video_update.id), notice: 'Now you can upload the video...' }


        format.json { render :show, status: :created, location: @app }
      else
        format.html { render :new }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    client = YouTubeIt::Client.new(username:ENV["YOUTUBE_LOGIN"], password:ENV["YOUTUBE_PASSWORD"], dev_key: ENV["YOUTUBE_API_KEY"])
    @upload_info = client.upload_token({title:@video_update.title, description:@video_update.title, category: "Tech", keywords:["flyy",@video_update.app.name]}, youtube_callback_startup_video_update_url(:startup_id=>@startup.id,:video_update_id=>@video_update.id))
  end

  def youtube_callback
    @video_update = @startup.video_updates.find_by_id(params[:video_update_id])

    if @video_update
      @video_update.youtube_id=params[:id]
      @video_update.save
      redirect_to startup_path(@startup.slug)
    else
      redirect_to root_path
    end
  end


  private
  def set_startup
    @startup = current_user.apps.find_by_id(params[:startup_id])

    redirect_to root_path if @startup.nil?
  end

  def set_video_update
    @video_update = @startup.video_updates.find_by_id(params[:id])
    redirect_to root_path if @video_update.nil?
 end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_update_params
    params.require(:video_update).permit(:title)
  end
end
