class BlogsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def show
    @blog = Blog.find_by(id: params[:id])
    @user = @blog.user
    @likes_count = Like.where(blog_id: @blog.id).count
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
      @blog.update(blogs_params)
      redirect_to blogs_path
    else
      flash[:alert] = "無効なユーザー"
      render "blogs/edit"
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
  
  private
    def blogs_params
      params.require(:blog).permit(:content, :title, :blog_published)
    end
  
  
  
end
