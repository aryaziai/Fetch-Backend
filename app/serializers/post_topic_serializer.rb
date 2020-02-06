class PostTopicSerializer < ActiveModel::Serializer
  attributes :id, :topic_id, :post_id
  belongs_to :post
end
