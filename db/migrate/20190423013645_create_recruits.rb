class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.integer :user_id
      t.string  :sports_name
      t.string  :title
      t.text    :content
      t.date    :event_date
      t.date    :limit_date
      t.string  :erea
      t.string  :prefecture

      t.timestamps
    end
  end
end
