class User < ApplicationRecord
    has_secure_password
    has_many :topics
    has_many :favorites
    has_many :post_topics, through: :topics
    has_many :posts, through: :favorites

    validates :username, presence: true, uniqueness: true


    validates :password, :presence => true, :length => {:within => 6..40}
    # validates :name, presence: true
end