class LikesController < ApplicationController
  before_action :authenticate_user
  
  def create
    @like = Like.new(
      user_id: @current_user.id,
      blog_id: params[:blog_id]
      )
    @like.save
    redirect_to("/blogs/#{params[:blog_id]}")
  end
  
  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      blog_id: params[:blog_id]
      )
    @like.destroy
    redirect_to("/blogs/#{params[:blog_id]}")
  end
  
end