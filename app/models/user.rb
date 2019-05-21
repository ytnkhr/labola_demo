class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :prefecture, optional: true
  belongs_to :teams
  belongs_to :team_entries
  
  # validates :name, {presence: true}
  def age
  date_format = "%Y%m%d"
  (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
  
end
