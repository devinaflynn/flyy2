class Comments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :app_id

      t.timestamps
    end
  end
end
