class AddSocialNetworksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :social_angelist, :string
    add_column :users, :social_github, :string
    add_column :users, :social_twitter, :string
    add_column :users, :social_facebook, :string
  end
end
