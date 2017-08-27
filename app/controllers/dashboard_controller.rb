class DashboardController < ApplicationController
  layout "dashboard"

  def index
    # Variable to set navbar active button
    @dashboard_class = "navbar-dashboard-link__active"
  end

  def crops
    @crops_class = "navbar-dashboard-link__active"
    @crops = current_user.crops
  end

  def profile
    @profile_class = "navbar-dashboard-link__active"
    @user = current_user
    # @user = User.find(params[:id])
    # @user = User.where.not(latitude: nil, longitude: nil)
    # @user_coordinates = { lat: @user.latitude, lng: @user.longitude }

    @users = User.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end
end
