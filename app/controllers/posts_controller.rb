class PostsController < ApplicationController
  
    skip_before_action :authorized
    def index
        # byebug
        posts = Post.all
        user = current_user
        # render json: { posts: PostSerializer.new(user.posts) }
        # render json: {posts: posts} THIS WORKS
        render json: {posts: posts}
        # render json: { posts: PostSerializer.new(posts) }
    end

    def show
        post = Post.find(params[:id])
        render json: {post:post}
    end

    def create
        post = Post.create(post_params)
        if post.valid?
        render json: {post: post}, status: :created
        else
            render json: {error: "Something went wrong"}, status: :not_acceptable
        end
    end


    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { destroy: params[:id]}
    end


    private


    def post_params
        params.require(:post).permit(:caption, :source, :image_url, :url, :published_at)
    end

end
