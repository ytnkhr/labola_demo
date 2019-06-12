class MessagesController < ApplicationController

  def new
    @message = Message.new
    @team_id = params[:id]
    @team = Team.find_by(id: params[:id])
    @team_entries = @team.team_entries
    @messages = @team.messages
  end
  
  def create
    if TeamEntry.where(:user_id => current_user.id, :team_id => params[:message][:team_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :team_id).merge(:user_id => current_user.id))
    else
      flash[:alert] = "無効なユーザー"
    end
    redirect_to "/messages/#{params[:message][:team_id]}/new"
  end
end