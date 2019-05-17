module LikesHelper
    
    def like_exist(user_id,blog_id)
       if Like.find_by(user_id: user_id, blog_id: blog_id)
         like_id = Like.find_by(user_id: user_id, blog_id: blog_id).id
         logger.debug("--------------- helper show.html like.id = #{like_id}")
         return like_id
       end 
    end
    
end
