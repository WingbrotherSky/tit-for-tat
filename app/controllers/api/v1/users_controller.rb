class Api::V1::UsersController < Api::V1::BaseController
  def show
    @user = User.find(params[:id])
  end

  def update
    if User.update(user_params)
      success_message
    else
      render json: { errors: "User not updated" }
    end
  end

  private

  def user_params
    params.require(:user).permit(:openid, :username, :bio, :location, :profile_image)
  end
end
