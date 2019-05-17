class ChangeColumnToRecruit < ActiveRecord::Migration[5.0]
  def change
      remove_column :recruits, :sports_name

      add_column :recruits, :sport_id, :integer

  end
end
