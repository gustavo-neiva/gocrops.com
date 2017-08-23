module ApplicationHelper
  def weather_data
    @temperature = session[:weather]["main"]["temp"]
    @temp_max = session[:weather]["main"]["temp_max"]
    @temp_min = session[:weather]["main"]["temp_min"]
    @humidity = session[:weather]["main"]["humidity"]
    @wind_speed = session[:weather]["wind"]["speed"]
    @main_weather = session[:weather]["weather"].first["main"]
    @clouds =  session[:weather]["clouds"]["all"]
    @sunrise = Time.at(session[:weather]["sys"]["sunrise"])
    @sunset = Time.at(session[:weather]["sys"]["sunset"])
    @description = session[:weather]["weather"].first["description"]
    @hours_sun = ((@sunset - @sunrise)/36000).round(2)
  end
end
