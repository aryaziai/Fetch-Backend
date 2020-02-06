class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :topic_title, :logo, :instagram, :twitter, :youtube, :google_news, :posts  #,:user
  # has_many :posts, through: :post_topic
end
