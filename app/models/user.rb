class User < ApplicationRecord
    has_many :posts
    
    # before_save { self.email = email.downcase }
    before_save { email.downcase!; user_type.downcase! }

    validates :username, presence: true, length: {maximum: 50}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-\d]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, length: { maximum: 255 },
                format:  { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

    validates :password, :password_confirmation, presence: true, length: { minimum: 6 }

    has_secure_password
end
    

