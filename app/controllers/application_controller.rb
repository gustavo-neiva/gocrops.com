require 'open_weather'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_weather_data

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

end
