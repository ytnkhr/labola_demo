class TeamEntriesController < ApplicationController
    def new
      @team_entry = TeamEntry.new
    end
    
    def create
      @team = Team.find_by(:id => params[:team_entry][:team_id])

      @team_entry = TeamEntry.new(:status => "w", :comment => params[:team_entry][:comment], :team_id => @team.id, :user_id => current_user.id)

      if !exist_user_teamentry(@team.user_id, @team.id)
        @team_entry_host = TeamEntry.create(:status => "a", :comment => params[:team_entry][:comment], :team_id => params[:team_entry][:team_id], :user_id => @team.user_id)
      end

      if @team_entry.save
        flash[:notice] = "#{@team_entry.team.name}に応募しました。"
        redirect_to "/teams/#{@team_entry.team_id}"
      else
        flash[:notice] = "応募できませんでした。"
        redirect_to "/teams"
      end
    end

    def accept
      @team_entry = TeamEntry.find_by(:status => "w")
      @team_entry.update(:status => "a")
      if @team_entry.save
        flash[:notice] = "#{@team_entry.user.name}を承認しました。"
        redirect_to "/teams/#{@team_entry.team_id}"
      else
        flash[:notice] = "#{@team_entry.user.name}を承認できませんでした。"
        redirect_to "/teams"
      end
    end

    def reject
      @team_entry = TeamEntry.find_by(:status => "w")
      @team_entry.update(:status => "r")
      if @team_entry.save
        flash[:notice] = "#{@team_entry.user.name}を拒否しました。"
        redirect_to "/teams"
      else
        flash[:notice] = "#{@team_entry.user.name}を拒否できませんでした。"
        redirect_to "/teams/#{@team_entry.team_id}"
      end
    end

end
