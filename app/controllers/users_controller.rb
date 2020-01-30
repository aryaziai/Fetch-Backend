class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: UserSerializer.new(users, {except: [:password_digest]})
    end

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user) 

    end

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: {error: "Something went wrong"}
        end
    end

    def destroy
        user = User.find(params[:id])
        if user.destroy
            render json: {message: "Successfully deleted user"}
        else
            render json: {error: "Something went wrong"}
        end
    end

    private

  

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name)
    end

end
