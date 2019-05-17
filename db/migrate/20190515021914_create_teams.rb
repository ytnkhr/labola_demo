class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.string  :name
      t.string  :prefecture_id
      t.string  :area
      t.string  :sport_id
      t.string  :start_level
      t.string  :end_level
      t.string  :start_age
      t.string  :end_age
      t.text    :introduction
      

      t.timestamps
    end
  end
end
