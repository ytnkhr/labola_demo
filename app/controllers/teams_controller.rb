class TeamsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def show
    @team = Team.find_by(id: params[:id])
    @user = @team.user
  end

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(teams_params)

    if @team.save
      flash[:notice] = "チームが作成されました。"
      redirect_to "/teams/#{@team.id}"
    else
      flash[:notice] = "チームが作成できませんでした。"
      render "teams/new"
    end
  end

  def edit
    @team = Team.find(params[:id])
    @user = User.find(@team.user_id)
    if @team.user_id == current_user.id
    else
      redirect_to "/teams"
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
    @team = Team.find(params[:id])
    @user = User.find(@team.user_id)
    if @team.user_id == current_user.id
      @team.update(teams_params)
      redirect_to teams_path
    else
      flash[:alert] = "無効なユーザー"
      render "teams/edit"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @user = User.find(@team.user_id)
    if @team.user_id == current_user.id
      @team.destroy
    else
      redirect_to "/teams"
      flash[:alert] = "無効なユーザー"
    end
  end
  
  private
    def teams_params
    params.require(:team).permit(:user_id, :sports_name, :area, :prefecture_id, :start_level, :end_level, :start_age, :end_age).merge(:user_id => current_user.id)
    end
  
    def team_params
      params.require(:team).permit(:name, :prefecture_id)
    end
  
end

