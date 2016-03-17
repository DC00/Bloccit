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
    user = User.find(params[:id])
    # Attempt to update attributes on given user
    if user.update_attributes(user_params)
      render json: user.to_json, status: 200
    else
      render json: { error: "User update failed", status: 400 }, status: 400
    end
  end

  def create

  end

  private

  # Define user_params to whitelist user params
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

end
