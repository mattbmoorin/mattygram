class LikesController < ApplicationController
    
    def save_like
        @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
        @post_id = params[:post_id]
       # Using AJAX with jquery here: 
        respond_to do |format|
          # Needs to be returned as JS since we are rendering a view  
          format.js { 
            unless @like.save
                @success = false
            end
            @success = true
            render 'posts/like'
        }
    end
    end

end
