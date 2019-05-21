class AddColumnTeamEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :team_entries, :comment, :text

  end
end
