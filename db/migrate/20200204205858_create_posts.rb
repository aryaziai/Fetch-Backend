class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :caption
      t.string :source
      t.string :image_url
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
