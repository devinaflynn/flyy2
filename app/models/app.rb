class App < ActiveRecord::Base

	CATEGORIES = %w(Website Mobile Product)

	mount_uploader :logo, LogoUploader

	belongs_to :user
	acts_as_votable

	scope :websites, 	-> {where(category: "Website")}
	scope :mobile, 		-> {where(category: "Mobile")}
	scope :products, 	-> {where(category: "Product")}


	def status_label
		if youtube_id.nil?
			"Video not uploaded"
		elsif is_processed 
			"Video ready to play"
		else
			"Video processing"
		end
	end
end
