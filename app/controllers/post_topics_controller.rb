class PostTopicsController < ApplicationController

    skip_before_action :authorized
    def index
        post_topics = PostTopic.all
        user = current_user
        # render json: { topics: TopicSerializer.new(user.topics) }
        render json: {post_topics: post_topics} # THIS WORKS
        # render json: { post_topics: PostTopicSerializer.new(post_topics)}
        # render json: PostTopicSerializer.new(post_topics)
        # render json: {post_topics: post_topics}
    end

    def show
        post_topic = PostTopic.find(params[:id])
        render json: {post_topic:post_topic}
    end



    def create
        # byebug
        post_topic = PostTopic.create(post_topic_params)
        if post_topic
        render json: {post_topic: post_topic}, status: :created
        else
            render json: {error: "Something went wrong"}, status: :not_acceptable
        end
    end


    def destroy
        post_topic = PostTopic.find(params[:id])
        post_topic.destroy
        render json: { destroy: params[:id]}
    end


    private

    def post_topic_params
        params.require(:post_topic).permit(:topic_id, :post_id)
    end

end
