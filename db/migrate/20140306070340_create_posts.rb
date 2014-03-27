class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.attachment :image
      t.date :data
      t.text :text

      t.timestamps
    end
  end
end
