class LikesController < ApplicationController
    
    def save_like
        @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
        #Use AJAX for this: 
        #respond_to do |format|
        #   format.json { 
        #       unless @like.save
        #           { success: false }
        #       end
        #           { success: true }
        #    }
        if @like.save
            redirect_to dashboard_path
        else
            redirect_to new_post_path
        end
    end
end
