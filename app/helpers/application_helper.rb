module ApplicationHelper
  def weather_session
    if session[:weather].present?
      session[:weather]
    else
      {"coord"=>{"lon"=>-43.21, "lat"=>-22.9},
         "weather"=>[{"id"=>800, "main"=>"Clear", "description"=>"clear sky", "icon"=>"01n"}],
         "base"=>"stations",
         "main"=>{"temp"=>19.74, "pressure"=>1021, "humidity"=>88, "temp_min"=>19, "temp_max"=>21},
         "visibility"=>10000,
         "wind"=>{"speed"=>2.6, "deg"=>170},
         "clouds"=>{"all"=>0},
         "dt"=>1503698400,
         "sys"=>{"type"=>1, "id"=>4565, "message"=>0.0088, "country"=>"BR", "sunrise"=>1503652114, "sunset"=>1503693652},
         "id"=>3451190,
         "name"=>"Rio de Janeiro",
         "cod"=>200}
      end
  end
  def main_weather
    @main_weather = weather_session["weather"].first["main"]
  end
  def weather_description
    @description = weather_session["weather"].first["description"]
  end
  def temperature
    @temperature = weather_session["main"]["temp"]
  end
  def temp_max
    @temp_max = weather_session["main"]["temp_max"]
  end
  def temp_min
    @temp_min = weather_session["main"]["temp_min"]
  end
  def humidity
    @humidity = weather_session["main"]["humidity"]
  end
  def wind_speed
    @wind_speed = weather_session["wind"]["speed"]
  end
  def clouds
    @clouds = weather_session["clouds"]["all"]
  end
  def sunrise_time
    @sunrise = Time.at(weather_session["sys"]["sunrise"])
  end
  def sunset_time
    @sunset = Time.at(weather_session["sys"]["sunset"])
  end
  def hours_sun
    @hours_sun = ((@sunset - @sunrise)/3600).round(2)
  end
end
