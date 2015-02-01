class CreateVideoUpdates < ActiveRecord::Migration
  def change
    create_table :video_updates do |t|
      t.string :title
      t.string :youtube_id
      t.integer :view_count, :default=>0
      t.boolean :is_processed, :default=>false
      t.references :app, index: true
      t.timestamps
    end
  end
end
