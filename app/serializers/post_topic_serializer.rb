class PostTopicSerializer < ActiveModel::Serializer
  attributes :id, :topic_id, :post_id
end
