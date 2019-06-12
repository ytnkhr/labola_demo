class AddColumnTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :team_icon, :string

  end
end
