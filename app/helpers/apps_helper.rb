module AppsHelper

	def app_youtube_embed_url(app)
		"//www.youtube.com/embed/#{app.youtube_id}?modestbranding=1;autohide=1&amp;showinfo=0&amp;controls=0;rel=0"
	end


end
