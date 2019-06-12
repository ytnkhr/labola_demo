class AddColumnBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :image_blog, :string
  end
end
