class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :logo, :instagram, :twitter, :youtube, :google_news, :user
  belongs_to :user
end
