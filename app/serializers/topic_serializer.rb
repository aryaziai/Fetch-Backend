class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :topic_title, :logo, :posts, :page_size, :language, :sort_by  #,:user
  # has_many :posts, through: :post_topic
end
