class DashboardController < ApplicationController
  layout "dashboard"

  def index
    # Variable to set navbar active button
    if params[:start_date].present? && params[:end_date].present?
      @start = params[:start_date]
      @end = params[:end_date]
    end
    @dashboard_class = "navbar-dashboard-link__active"
    @products = Product.all

  end

  def crops
    @crops_class = "navbar-dashboard-link__active"
    @crops = current_user.crops
  end

  def profile
    @profile_class = "navbar-dashboard-link__active"
    @user = current_user
    @user_coordinates = { lat: @user.latitude, lng: @user.longitude }
  end
end
