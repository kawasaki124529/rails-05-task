class User < ApplicationRecord
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { in: 8..32 }
    validates :password_confirmation, presence: true, length: { in: 8..32 }
    
    has_secure_password
    
    has_many :topics
end
