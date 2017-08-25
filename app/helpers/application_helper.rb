module ApplicationHelper
  def temperature
    @temperature = session[:weather]["main"]["temp"]
  end
  def temp_max
    @temp_max = session[:weather]["main"]["temp_max"]
  end
  def temp_min
    @temp_min = session[:weather]["main"]["temp_min"]
  end
  def humidity
    @humidity = session[:weather]["main"]["humidity"]
  end
  def wind_speed
    @wind_speed = session[:weather]["wind"]["speed"]
  end
  def main_weather
    @main_weather = session[:weather]["weather"].first["main"]
  end
  def clouds
    @clouds =  session[:weather]["clouds"]["all"]
  end
  def sunrise_time
    @sunrise = Time.at(session[:weather]["sys"]["sunrise"])
  end
  def sunset_time
    @sunset = Time.at(session[:weather]["sys"]["sunset"])
  end
  def weather_description
    @description = session[:weather]["weather"].first["description"]
  end
  def day_duration
    @hours_sun = ((@sunset - @sunrise)/36000).round(2)
  end
end
