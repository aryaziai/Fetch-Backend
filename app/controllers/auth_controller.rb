class AuthController < ApplicationController

    # before_action :authorized, except: [:create]
    # skip_before_action :authorized
   
    def create
      # byebug
      @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    def re_auth
      render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end
   
    private
   
    def user_login_params
      params.require(:user).permit(:username, :password)
    end

  end