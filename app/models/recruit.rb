class Recruit < ApplicationRecord
  validates :content, {presence:true, length:{maximum:10000}}
  validates :user_id, {presence:true}
  
  belongs_to :prefecture, optional: true

  validate :start_end_check

  def start_end_check
    errors.add(:deadline, "募集期限は開催日前または当日にしてください。") unless
    self.deadline < self.hold_on
  end 
  
  def user
    return User.find_by(id: self.user_id)
  end


end
