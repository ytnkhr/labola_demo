class RemoveEndDateColumnToRecruits < ActiveRecord::Migration[5.0]
  def change
      remove_column :recruits, :end_date

  end
end
