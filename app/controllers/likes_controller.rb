class LikesController < ApplicationController
    
  def save_like
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post_id = params[:post_id]
    like_exists = Like.where(post_id: params[:post_id], account_id: current_account.id)
    # Using AJAX with jquery here: 
    respond_to do |format|
      # Needs to be returned as JS since we are rendering a view  
      format.js { 
        if like_exists.any?
          like_exists.first.destroy
          @success = false
        elsif @like.save
          @success = true
        else 
          @success = false
        end
      
        # Get value from post itself when clicked
        @post_likes = Post.find(@post_id).total_likes_count
        render 'posts/like'
      }
    end
  end

end  


