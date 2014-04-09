class AddViewCountToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :view_count, :integer
  end
  def down
    remove_column :posts, :view_count
  end
end
