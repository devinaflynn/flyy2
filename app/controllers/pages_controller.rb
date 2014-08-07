class PagesController < ApplicationController
  def index
  	@last_video = client.video_by("TxCrqHODQdM")
  end

  def index2
  end

  def updates
  end

  def show
  end

  def upload
    client = YouTubeIt::Client.new(username:ENV["YOUTUBE_LOGIN"], password:ENV["YOUTUBE_PASSWORD"], dev_key: ENV["YOUTUBE_API_KEY"])
    @upload_info = client.upload_token({title:"test from rails", description:"Test video uploaded from rails app",category: "Tech", keywords:["rails-sample-app","flyy"]}, root_url)
  end  

end
