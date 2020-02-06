class FavoritesController < ApplicationController
   
    def index
        favorite = Favorite.all
        user = current_user
        # render json: { topics: TopicSerializer.new(user.topics) }
        # render json: {topics: topics} THIS WORKS
        render json: {favorite: favorite}
    end

    def show
        favorite = Favorite.find(params[:id])
        render json: {favorite:favorite}
    end



    def create
        # byebug
        favorite = Favorite.create(favorite_params)
        if favorite
        render json: {favorite: favorite}, status: :created
        else
            render json: {error: "Something went wrong"}, status: :not_acceptable
        end
    end


    def destroy
        favorite = Favorite.find(params[:id])
        favorite.destroy
        render json: { destroy: params[:id]}
    end


    private

    def favorites_params
        params.require(:favorite).permit(:post_id, :user_id)
    end

end
