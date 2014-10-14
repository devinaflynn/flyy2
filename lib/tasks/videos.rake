namespace :videos do
  desc "Update view counts for youtube videos:"
  task :update_view_count => :environment do
    App.where("youtube_id IS NOT NULL").each do |app|
      puts "#{app.name} - Updating view_count."
      begin
        client   = YouTubeIt::Client.new(username:ENV["YOUTUBE_LOGIN"], password:ENV["YOUTUBE_PASSWORD"], dev_key: ENV["YOUTUBE_API_KEY"])
        yt_video = client.my_video(app.youtube_id)
        app.update_attributes({view_count: yt_video.view_count})
      rescue YouTubeIt::ResourceNotFoundError => e
        puts "ERROR: Video not found for app: #{app.name}"
        # noop
      end
    end
  end
end