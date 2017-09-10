class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized
    def create
      user = User.create(user_params)
      render json: user
    end

    def index
      users = User.all
      render json: users
    end

    def show
      user = User.find(params[:id])
      scripts = user.scripts
      render json: {user: user, scripts: scripts}
    end

    def update
      user = User.find(params[:id])
      user.update(user_params)
      render json: user
    end


    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation)
    end
  end

end
