class RenameTitreColumnToLikes < ActiveRecord::Migration[5.0]
  def change
    rename_column :likes, :post_id, :blog_id
  end
end
