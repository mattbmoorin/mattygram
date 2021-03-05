class AccountsController < ApplicationController
    before_action :set_account, only: [:show]

    def index
        # user dashboard - feed
        @posts = Post.active
        @comment = Comment.new
        # Using where not so user's own ID is not returned here
        @follower_suggestions = Account.where.not(id: current_account.id)
    end

    def show
        # user profile
    end

    # WHY DOES THIS ONLY WORK FOR NON OAUTH USERS?? UGH!!
    def set_account
        @account = Account.find_by_username(params[:username])
    end
end
