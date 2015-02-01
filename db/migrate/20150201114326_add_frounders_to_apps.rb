class AddFroundersToApps < ActiveRecord::Migration
  def change
    add_column :apps, :founders, :string 
  end
end
