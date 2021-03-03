class PostsController < ApplicationController
    
    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.account_id = current_account.id if account_signed_in?
      @post.username = current_account.username if account_signed_in?

      if @post.save
        redirect_to dashboard_path, flash: { success: "Post was created successfully" }
      else
        redirect_to new_post_path, flash: { danger: "Get on the floor" }
      end
    end

    def edit
      @post = Post.find(params[:id])
      redirect_to dashboard_path, flash: { danger: "You do not have permission to edit this post" } if @post.account_id != current_account.id
    end

    def update
      @post = Post.find(params[:id])
      @post.update(description: params[:description])
      @post.save
      redirect_to dashboard_path
    end

    def show
    end

    def resize
      @image = MiniMagick::Image.open(@post.image.url)
      @image.resize "25%"
    end

    private

    def post_params
      params.require(:post).permit(:image, :image_cache, :description)
    end
end