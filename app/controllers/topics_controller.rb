class TopicsController < ApplicationController
    skip_before_action :authorized #, only: [:create, :index, :show] My authorization is not working. por que?

    def index
        # byebug
        topics = Topic.all
        # user = current_user
        # render json: { topics: TopicSerializer.new(user.topics) }
        # render json: {topics: topics} THIS WORKS
        # render json: {topics: topics}
        render json: {topics: TopicSerializer.new(topics)}
    end

    def show
        topic = Topic.find(params[:id])
        render json: {topic: TopicSerializer.new(topic)}
        
    end

    def create
        topic = Topic.create(topic_params)
        if topic.valid?
          render json: {topic: TopicSerializer.new(topic) }, status: :created
        else
          render json: {error: "Something went wrong"}, status: :not_acceptable
        end
    end


    def destroy
        # topic = Topic.find(params[:id])
        # post = Post.find(params[:id])
        # byebug
        # topic.destroy
        # render json: { destroy: params[:id]}
    end


    private


    def topic_params
        params.require(:topic).permit(:user_id, :topic_title, :page_size, :plus, :sort_by, :language, :logo) #recently deleted :posts
    end

end
