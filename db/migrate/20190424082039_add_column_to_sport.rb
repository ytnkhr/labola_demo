class AddColumnToSport < ActiveRecord::Migration[5.0]
  def change
            add_column :sports, :category, :integer

  end
end
