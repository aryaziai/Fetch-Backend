class Topic < ApplicationRecord
    belongs_to :user
    has_many :post_topics
    has_many :posts, through: :post_topics

    # validates :topic_title, presence: true #uniqueness: true .. was causing issues


    validates :topic_title, presence: true #uniqueness: true .. was causing issues
end
