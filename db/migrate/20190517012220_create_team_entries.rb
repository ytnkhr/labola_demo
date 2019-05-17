class CreateTeamEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :team_entries do |t|
      t.integer :team_id
      t.integer :user_id
      t.string  :status

      t.timestamps
    end
  end
end
