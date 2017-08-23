require 'open_weather'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_weather_data

  private

  def get_weather_data
    options = { units: "metric", APPID: ENV['OpenWeather'] }
    if session[:weather].nil? && current_user && current_user.farm_location
      session[:weather] = OpenWeather::Current.city(current_user.farm_location, options)
    end
    # reset_session
  end

end
