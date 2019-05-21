module TeamsHelper
    def team_entried(team)
      if TeamEntry.find_by(team_id: team, user_id: current_user.id)
        return true
      else
        return false
      end
    end
    
end
