class BlogsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def show
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
  end

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(params.require(:blog).permit(:content, :title, :blog_published, :user_id).merge(:user_id => current_user.id))
    @user = User.find(@blog.user_id)
  end

  def edit
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    if @blog.user_id == current_user.id
    else
      redirect_to "/blogs"
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    if @blog.user_id == current_user.id
      @blog.update(params.require(:blog).permit(:content, :title, :blog_published))
    else
      redirect_to "/blogs"
      flash[:alert] = "無効なユーザー"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    if @blog.user_id == current_user.id
      @blog.destroy
    else
      redirect_to "/blogs"
      flash[:alert] = "無効なユーザー"
    end
  end
end
