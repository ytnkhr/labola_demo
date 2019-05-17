class Team < ApplicationRecord
    has_many :messages
    has_many :team_entries
end
