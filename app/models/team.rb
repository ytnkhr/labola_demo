class Team < ApplicationRecord
    has_many :messages
    has_many :team_entries
    has_many :users
    
    def user
      return User.find_by(id: self.user_id)
    end
end
