class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
        add_column :users, :name, :string
        add_column :users, :gender, :string
        add_column :users, :icon_name, :string
        add_column :users, :profile, :text
        add_column :users, :area, :string
        add_column :users, :birthday, :date
        add_column :users, :birth_published, :string
        add_column :users, :favor, :string

  end
end
