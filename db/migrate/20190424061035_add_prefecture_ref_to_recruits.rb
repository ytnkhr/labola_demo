class AddPrefectureRefToRecruits < ActiveRecord::Migration[5.0]
  def change
    remove_column :recruits, :prefecture_id
    
    add_reference :recruits, :prefecture, foreign_key: true
  end
end
