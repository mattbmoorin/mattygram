class LikesController < ApplicationController
    
    def save_like
        @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
        #refactor to AJAX
        if @like.save
            redirect_to dashboard_path
        else
            redirect_to new_post_path
        end
    end
end
