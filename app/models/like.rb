class Like < ApplicationRecord
  belongs_to :account
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :account_id
  after_create :increase_post_likes_counter
  after_destroy :decrease_post_likes_counter

  private

  # Find post id that like belongs to and increment or decrement counter
  def increase_post_likes_counter
    Post.find(self.post_id).increment(:total_likes_count).save
  end
  def decrease_post_likes_counter
    Post.find(self.post_id).decrement(:total_likes_count).save
  end

end