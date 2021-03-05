class Post < ApplicationRecord
  default_scope {order(created_at: :desc)}
  mount_uploader :image, ImageUploader
    
  belongs_to :account
  has_many :likes
  has_many :comments

  before_create :set_active
    
  scope :active, -> { where active: true }

  def self.longest_description
    a = Post.where.not(description: nil)
    a.sort_by {|x| x.description.length}.last
  end

  private 

  def set_active
    self.active = true
  end
end
