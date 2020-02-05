class PostTopicsController < ApplicationController
    belongs_to :topic
    belongs_to :post
end
