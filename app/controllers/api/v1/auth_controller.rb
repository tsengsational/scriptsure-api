class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

    def show
      user = current_user
      render json: {user: user, circles: user.circles, fellowships: user.fellowships}
    end

    def verify
      user = current_user
      if user
        payload = { user_id: user.id}
        token = issue_token(payload)
        render json: {
          user: {
            username: user.username,
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email
          },
          scripts: user.scripts,
          jwt: token
        }
      else
        render json: {errors: "That username/password combination does not match a record in our database."}
      end
    end

    def create
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])

        payload = { user_id: user.id}
        token = issue_token(payload)
        render json: {
          user: {
            username: user.username,
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email
          },
          scripts: user.scripts,
          jwt: token
        }
      else
        render json: {errors: "That username/password combination does not match a record in our database."}
      end
    end

end
