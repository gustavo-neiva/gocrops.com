require 'open_weather'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_weather_data
  before_action :active_navbar, if: :devise_controller?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path
  end

  private

  def get_weather_data
    options = { units: "metric", APPID: ENV['OpenWeather'] }
    if session[:weather].nil? && current_user && current_user.farm_location
      session[:weather] = OpenWeather::Current.city(current_user.farm_location, options)
    end
  end

  def active_navbar
    # Checks if users is in devise#edit
    # Add profile class params to active navbar
    if params[:controller] == "devise/registrations" && params[:action] == "edit"
      @profile_class = "navbar-dashboard-link__active"
    end
  end

end
