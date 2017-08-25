class Dashboard::ProfilesController < ApplicationController
  layout "dashboard"

  before_action :set_user, only: [:edit, :update, :show]
  before_action :active_navbar, only: [:edit, :edit_farm]

  def show
    @flat = Flat.find(params[:id])
    @alert_message = "You are viewing #{@flat.name}"
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_info_params)
      redirect_to dashboard_profile_path
    else
      render :edit
    end
  end


  private

  def active_navbar
    # Checks if users is in devise#edit
    # Add profile class params to active navbar
    @profile_class = "navbar-dashboard-link__active"
  end

  def set_user
    @user = current_user
  end

  def user_info_params
    params.require(:user).permit(:first_name, :last_name, :facebook_picture_url,
                                 :bio, :phone, :avatar, :avatar_cache)
  end
end
