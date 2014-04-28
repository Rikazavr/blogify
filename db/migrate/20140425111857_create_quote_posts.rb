class CreateQuotePosts < ActiveRecord::Migration
  def change
    create_table :quote_posts do |t|
      t.text :quote
      t.string :author

      t.timestamps
    end
  end
end
