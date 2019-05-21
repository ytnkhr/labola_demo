class TeamEntriesController < ApplicationController
    def new
      @team_entry = TeamEntry.new
    end
    
    def create
      @team = Team.find_by(id: params[:id])
      @team_entry = TeamEntry.create(:team_id => @team.id, :user_id => current_user.id)
      redirect_to "/teams/#{@team_id}"
    end
end
