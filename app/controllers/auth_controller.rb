class AuthController < ApplicationController

  skip_before_action :authorized, only: [:create] #dont run authorized before create
 
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
    params.require(:auth).permit(:username, :password,:first_name,:last_name)
  end

end
