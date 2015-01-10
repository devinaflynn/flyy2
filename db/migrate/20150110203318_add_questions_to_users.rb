class AddQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio_1st_question, :text
    add_column :users, :bio_2nd_question, :text
    add_column :users, :bio_3rd_question, :text
  end
end
