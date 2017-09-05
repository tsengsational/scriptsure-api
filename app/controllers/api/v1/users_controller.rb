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
      jams = user.jams
      stories = user.stories
      render json: {user: user, jams: jams, stories: stories}
    end

    def update
      user = User.find(params[:id])
      user.update(jam_params)
      render json: user
    end


    private

    def jam_params
      params.require(:user).permit(:name, :description, :password, :password_confirmation)
    end
  end

end
