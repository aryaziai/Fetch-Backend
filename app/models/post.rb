class Post < ApplicationRecord
    has_many :post_topics
    has_many :favorites
    has_many :topics, through: :post_topics
    has_many :users, through: :favorites
end
