class DashboardController < ApplicationController
  layout "dashboard"

  def index
    # Variable to set navbar active button
    @dashboard_class = "navbar-dashboard-link__active"
  end

  def crops
    @crops_class = "navbar-dashboard-link__active"
  end

  def profile
    @profile_class = "navbar-dashboard-link__active"
  end
end
