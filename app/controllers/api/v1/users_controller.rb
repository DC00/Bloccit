class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :authorize_user

  # finds a user based on id. Renders user object as json
  # and returns http 200
  def show
    user = User.find(params[:id])
    render json: user.to_json, status: 200
  end

  # Index renders all users as json
  def index
    users = User.all
    render json: users.to_json, status: 200
  end

  def update

  end

  def create

  end

end
