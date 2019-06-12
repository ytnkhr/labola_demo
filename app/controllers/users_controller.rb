class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chat = Chat.new
  end
  
  def index
    @users = User.all
  end
end
