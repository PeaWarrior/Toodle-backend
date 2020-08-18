class Image < ApplicationRecord
    mount_base64_uploader :art, ImageUploader
    has_one_attached :art
    belongs_to :user
end
