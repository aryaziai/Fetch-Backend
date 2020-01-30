class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :logo
      t.string :instagram
      t.string :twitter
      t.string :youtube
      t.string :google_new
      t.integer :user_id
      
      t.timestamps
    end
  end
end
