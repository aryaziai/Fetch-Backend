class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :source, :image_url, :url, :published_at
  # belongs_to :post
end
