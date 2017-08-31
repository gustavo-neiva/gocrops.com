class DashboardController < ApplicationController
  layout "dashboard"

  def index
    # Variable to set navbar active button
    if params[:start_date].present? && params[:end_date].present?
      @start = params[:start_date]
      @end = params[:end_date]
      @product_id = params[:product_id]
    end
    @dashboard_class = "navbar__dashboard__link--active"
    @products = Product.all

  end

  def crops
    @crops_class = "navbar__dashboard__link--active"
    @crops = current_user.crops
  end

  def profile
    @profile_class = "navbar__dashboard__link--active"
    @user = current_user
    @user_coordinates = { lat: @user.latitude, lng: @user.longitude }
  end

  def graph
    @product = Product.find(params[:product_id])
    start_date_parsed = Date.strptime(params[:start_date], "%d/%m/%Y").strftime("%Y/%m/%d")
    end_date_parsed = Date.strptime(params[:end_date], "%d/%m/%Y").strftime("%Y/%m/%d")
    @graph = @product.historic_data_array(start_date_parsed, end_date_parsed)
  end
end
