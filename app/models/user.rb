class User < ApplicationRecord
    has_secure_password
    has_many :topics
    has_many :favorites
    has_many :post_topics, through: :topics
    has_many :posts, through: :favorites

    validates :username, presence: true, uniqueness: true



validates :password, presence: true, :length => {:within => 5..25}, format: {with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./}
    # validates :name, presence: true
end