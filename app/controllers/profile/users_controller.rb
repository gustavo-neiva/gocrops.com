class Profile::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]

  def edit
  end

  def update
    if @user.update(user_params)
    redirect_to edit_profile_users_path
    else
      render :edit
    end

  end

  def show
  end


  private


  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :facebook_picture_url, :farm_location, :farm_certification, :farm_size, :phone, :bio, :avatar, :avatar_cache, :farm_picture, :farm_picture_cache)
  end
end
