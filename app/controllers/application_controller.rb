class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def exist_user_teamentry(user,team)
    if TeamEntry.find_by(:team_id => team, :user_id => user)
      logger.debug("--------------------- exist_user_teamentry exist") 
      return true
    else
      logger.debug("--------------------- exist_user_teamentry no_exist") 
      return false
    end
  end
  
  def sport
    @sport = Sport.find_by(:id, :name)
    @sports = Sport.all
  end
end
