class RenamePrefectureColumnToRecruits < ActiveRecord::Migration[5.0]
  def change
        add_column    :recruits, :prefecture_id, :integer
        add_column    :recruits, :hold_start, :time
        add_column    :recruits, :hold_end, :time
        add_column    :recruits, :dead_end, :time
        add_column    :recruits, :end_level, :string

        rename_column :recruits, :start_date, :hold_on
        rename_column :recruits, :limit_date, :deadline
        rename_column :recruits, :level, :start_level

        remove_column :recruits, :prefecture

  end
end
