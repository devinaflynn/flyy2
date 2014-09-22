class AddYoutubeFieldsToApps < ActiveRecord::Migration
  def change
  	add_column :apps, :youtube_id, :string
  	add_column :apps, :view_count, :integer, :default=>0
  	add_column :apps, :is_processed, :boolean, :default=>false
  end
end
