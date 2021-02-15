class Post < ApplicationRecord
    belongs_to :account
    mount_uploader :image, ImageUploader
    
    before_create :set_active
    
    scope :active, -> { where active: true }

    def set_active
        self.active = true
    end
end
