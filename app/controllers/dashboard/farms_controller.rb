class Dashboard::FarmsController < ApplicationController
  before_action do
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update_attributes(farm_params)
      redirect_to dashboard_profile_path
    else
      render :edit_farm
    end
  end

  private
    def farm_params
      params.require(:user).permit(:farm_location, :farm_name, :farm_size, :farm_certification,
                                   :farm_picture, :farm_picture_cache)
    end
end
