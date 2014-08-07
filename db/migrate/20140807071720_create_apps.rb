class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :tagline
      t.string :website

      t.timestamps
    end
  end
end
