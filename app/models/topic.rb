class Topic < ApplicationRecord
    belongs_to :user
    has_many :post_topics
    has_many :posts, through: :post_topics
end
