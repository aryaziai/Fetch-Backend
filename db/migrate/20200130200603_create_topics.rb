class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :topic_title
      t.string :logo
      t.string :instagram
      t.string :twitter
      t.string :youtube
      t.boolean :google_news
      t.integer :user_id
      
      t.timestamps
    end
  end
end
