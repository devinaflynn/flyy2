class AddVotingCachesToApp < ActiveRecord::Migration
  def change
  	add_column :apps, :cached_votes_total, :integer, :default => 0
  	add_index  :apps, :cached_votes_total
  end
end
