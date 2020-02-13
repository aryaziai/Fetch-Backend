class PostSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :id, :caption, :source, :image_url, :url, :published_at, :topics
  # belongs_to :post
end
