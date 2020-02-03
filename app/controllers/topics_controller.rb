class TopicsController < ApplicationController
    skip_before_action :authorized
    # before_action :authorized, only: [:index]
    def index
        # byebug
        topics = Topic.all
        user = User.find(params[:id]) 
        render json: {topics: user.topics}
        # render json: {topics: topics}
    end

    def show
        topic = Topic.find(params[:id])
        render json: {topic:topic}
    end




    def create
        # byebug
        topic = Topic.create(topic_params)
        if topic.valid?
        render json: {topic: topic}, status: :created
        else
            render json: {error: "Something went wrong"}, status: :not_acceptable
        end
    end


    def destroy
        topic = Topic.find(params[:id])
        topic.destroy
        render json: { destroy: params[:id]}
    end


    private


    def topic_params
        params.require(:topic).permit(:user_id, :topic_title, :instagram, :twitter, :youtube, :google_news)
    end

end
