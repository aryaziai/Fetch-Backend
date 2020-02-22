class PostsController < ApplicationController
  
    skip_before_action :authorized # not authorizing for anything
    def index
        # byebug
        posts = Post.all
        user = current_user
        # render json: { posts: PostSerializer.new(user.posts) }
        render json: {posts: PostSerializer.new(posts)}
        # render json: { posts: PostSerializer.new(posts) }
    end

    def show
        post = Post.find(params[:id])
        render json: {post: PostSerializer.new(post)}
    end

    def create
        # check if a topic already has a post. if so don't create it.
        # if it doesn't have the post, then create it.

        # find by post.url if not found, create it.
        # byebug
        topic = Topic.find(params[:topic_id])

        # byebug
        # if topic.posts.find_by(url: post_params["url"])
        #     render json: {error: "Something went wrong"}, status: :not_acceptable
        # else 
            post = Post.create(post_params)
            if post.valid?
            render json: {post: post}, status: :created
            else
                render json: {error: "Something went very wrong"}, status: :not_acceptable
            end
        end
    end


    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { destroy: params[:id]}
    end


    private


    def post_params
        params.require(:post).permit(:caption, :source, :image_url, :url, :published_at, :topic_id)
    end

end
