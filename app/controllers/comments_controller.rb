class CommentsController < ApplicationController

    def create
      @comment = Comment.new(comment_params)
      @comment.account_id = current_account.id if account_signed_in?

      if @comment.save
        redirect_to dashboard_path, flash: { success: "Comment was created successfully" }
      else
        redirect_to dashboard_path, flash: { danger: "Get on the floor" }
      end
    end

    def resize
      @image = MiniMagick::Image.open(@comment.image.url)
      @image.resize "25%"
    end

    private

    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end