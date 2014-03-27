class ChangeDataInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :data, :date
  end
end
