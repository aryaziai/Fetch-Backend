class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :topic_title, :logo, :instagram, :twitter, :youtube, :google_news
  belongs_to :user
end
