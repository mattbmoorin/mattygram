class AccountsController < ApplicationController
    before_action :set_account, only: [:show]
    
    # Ask why before_action instance variable returns nil in view

    def index
        # user dashboard - feed
        @posts = Post.active
    end

    def show
        # user profile  
    end

    def set_account
        @account = Account.find_by_username(params[:username])
    end
end
