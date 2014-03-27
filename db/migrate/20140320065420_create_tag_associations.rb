class CreateTagAssociations < ActiveRecord::Migration
  def change
    create_table :tag_associations do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
