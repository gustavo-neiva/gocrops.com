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
    # @user = User.where.not(latitude: nil, longitude: nil)
    @user_coordinates = { lat: @user.latitude, lng: @user.longitude }

    # @user = current_user
    # @users = User.where.not(latitude: nil, longitude: nil)

    # @hash = Gmaps4rails.build_markers(@user) do |user, marker|
    #   marker.lat user.latitude
    #   marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
  #   end
  end
end
