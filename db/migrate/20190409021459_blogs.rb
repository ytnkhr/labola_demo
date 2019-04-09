class Blogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string  :title
      t.integer :user_id
      t.text    :content
      t.string  :blog_published
      t.timestamps null: false

    end
  end
end

