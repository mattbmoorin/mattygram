class Like < ApplicationRecord
  belongs_to :account
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :account_id
  #after_create :update_post_likes_counter

  private

  # Find post id that like belongs to and increment counter
  def update_post_likes_counter
    Post.find(self.post_id).update.increment(:total_likes_count).save
  end

end