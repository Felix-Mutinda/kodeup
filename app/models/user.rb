class User < ApplicationRecord
    has_many :posts
    validates :email, presence: true
    validates :username, presence: true
    validates :username, length: {maximum: 50}
    validates :email, length: { maximum: 255 }
end
