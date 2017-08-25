class DashboardController < ApplicationController
  layout "dashboard"

  def index
    # Variable to set navbar active button
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
  end
end
