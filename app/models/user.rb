class User < ApplicationRecord
    has_many :images, dependent: :destroy
end
