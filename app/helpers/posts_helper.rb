module PostsHelper
  # n + 1 query, need to refactor (query within a loop)
  def post_liked_by_user? post_id
    Like.where(post_id: post_id, account_id: current_account.id).any?
  end

  def can_edit_post? account_id
    @posts.id == account_id
  end
end