class AddColumnRecruits < ActiveRecord::Migration[5.0]
  def change
        add_column :recruits, :recruit_type, :string
        add_column :recruits, :end_date, :date
        add_column :recruits, :place, :string
        add_column :recruits, :capacity, :integer
        add_column :recruits, :team_id, :integer
        add_column :recruits, :cost, :integer
        add_column :recruits, :level, :string
        add_column :recruits, :start_age, :integer
        add_column :recruits, :end_age, :integer
        add_column :recruits, :tag_name, :string
        add_column :recruits, :image_name, :string

        rename_column :recruits, :event_date, :start_date

  end
end
