class RecruitsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  require 'time'

  def show
    @recruit = Recruit.find_by(id: params[:id])
    @user = @recruit.user
  end

  def index
    @recruits = Recruit.all
  end

  def new
    @recruit = Recruit.new
  end

  def create
    logger.debug("------------------hold_on=#{params[:recruit][:deadline]}")
    @recruit = Recruit.new(recruits_params)
    @user = User.find(@recruit.user_id)

    if @recruit.save
      flash[:notice] = "募集が作成されました。"
      redirect_to "/recruits"
    else
      flash[:notice] = "募集が作成できませんでした。"
      render "recruits/new"
    end
  end

  def edit
    @recruit = Recruit.find(params[:id])
    @user = User.find(@recruit.user_id)
    if @recruit.user_id == current_user.id
    else
      redirect_to "/recruits"
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
    @recruit = Recruit.find(params[:id])
    @user = User.find(@recruit.user_id)
    if @recruit.user_id == current_user.id
      @recruit.update(recruits_params)
      redirect_to recruits_path
    else
      flash[:alert] = "無効なユーザー"
      render "recruits/edit"
    end
  end

  def destroy
    @recruit = Recruit.find(params[:id])
    @user = User.find(@recruit.user_id)
    if @recruit.user_id == current_user.id
      @recruit.destroy
    else
      redirect_to "/recruits"
      flash[:alert] = "無効なユーザー"
    end
  end
  
  private
    def recruits_params
    params.require(:recruit).permit(:user_id, :sports_name, :title, :content, :hold_on, :hold_start, :hold_end,
    :deadline, :dead_end, :erea, :prefecture_id, :recruit_type, :place, :capacity, :team_id,
    :cost, :start_level, :end_level, :start_age, :end_age, :tag_name, :image_name).merge(:user_id => current_user.id)
    end
  
    def recruit_params
      params.require(:recruit).permit(:name, :prefecture_id)
    end
  
end
