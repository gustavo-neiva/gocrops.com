class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :get_weather_data, only: [:home]

  def home
    @user = User.new
  end
  
end
