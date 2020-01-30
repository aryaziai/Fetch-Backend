class TopicsController < ApplicationController
    skip_before_action :authorized

    def index
        # byebug
        # topics = Topic.all
        # user = User.find(params[:user_id])
        render json: {topics:current_user.topics}
        # render json: {topics: topics}
    end

    def show
        topic = Topic.find(params[:id])
        render json: {topic:topic}
    end


end
