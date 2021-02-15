class AccountsController < ApplicationController
    def index
        # user dashboard - feed
        @posts = Post.active
    end

    def show
        # user profile
    end
end
