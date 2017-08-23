class Profile::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to dashboard_path
  end

  def show
  end


  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :facebook_picture_url, :farm_location, :farm_certification, :farm_size, :phone, :bio, :avatar, :farm_picture)
  end
end
