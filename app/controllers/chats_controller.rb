class ChatsController < ApplicationController

  def new
    @chat = Chat.new
    @sender_id = current_user.id
    @sender = User.find_by(id: current_user.id)
    @receiver_id = params[:id]
    @receiver = User.find_by(id: params[:id])
    @chats = Chat.all
  end

  def create
    @chat = Chat.create(params.require(:chat).permit(:sender_id, :content, :receiver_id).merge(:sender_id => current_user.id))
    redirect_to "/chats/#{params[:chat][:receiver_id]}/new"
  end
end
