class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :topic_title
      t.string :logo
      t.integer :page_size
      t.string :language
      t.string :sort_by
      t.boolean :plus
      t.integer :user_id
      
      t.timestamps
    end
  end
end
