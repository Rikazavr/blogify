class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :comment
      t.belongs_to :post, index: true
      t.string :ancestry, index: true

      t.timestamps
    end
  end
end
