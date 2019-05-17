class LikesController < ApplicationController
  # before_action :authenticate_user
  
  def create
    logger.debug("==================== user_id = #{current_user.id}... blog_id = #{params[:id]}")
    @like = Like.new(
      user_id: current_user.id,
      blog_id: params[:id]
      )
    @like.save
    redirect_to("/blogs/#{params[:id]}")
  end
  
  def destroy
    @like = Like.find(params[:id])

    @like.destroy
    redirect_to("/blogs/#{@like.blog_id}")
  end
  
end