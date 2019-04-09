class Blog < ApplicationRecord
  validates :content, {presence:true, length:{maximum:140}}
  validates :user_id, {presence:true}
  
  has_many :likes, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end

end
