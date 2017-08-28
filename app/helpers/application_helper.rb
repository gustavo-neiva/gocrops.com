module ApplicationHelper

  def session_weather
      return session[:weather] if session[:weather].present?

      return {"coord"=>{"lon"=>-43.21, "lat"=>-22.9},
       "weather"=>[{"id"=>800, "main"=>"Clear", "description"=>"clear sky", "icon"=>"01d"}],
       "base"=>"stations",
       "main"=>{"temp"=>23.77, "pressure"=>1023, "humidity"=>50, "temp_min"=>22, "temp_max"=>25},
       "visibility"=>10000,
       "wind"=>{"speed"=>2.1, "deg"=>330},
       "clouds"=>{"all"=>0},
       "dt"=>1503669600,
       "sys"=>{"type"=>1, "id"=>4565, "message"=>0.0934, "country"=>"BR", "sunrise"=>1503652132, "sunset"=>1503693645},
       "id"=>3451190,
       "name"=>"Rio de Janeiro",
       "cod"=>200
     }

  end


  def main_weather
    @main_weather = session_weather["weather"].first["main"]
  end
  def weather_description
    @description = session_weather["weather"].first["description"]
  end
  def temperature
    @temperature = session_weather["main"]["temp"]
  end
  def temp_max
    @temp_max = session_weather["main"]["temp_max"]
  end
  def temp_min
    @temp_min = session_weather["main"]["temp_min"]
  end
  def humidity
    @humidity = session_weather["main"]["humidity"]
  end
  def wind_speed
    @wind_speed = session_weather["wind"]["speed"]
  end
  def clouds
    @clouds =  session_weather["clouds"]["all"]
  end
  def sunrise_time
    @sunrise = Time.at(session_weather["sys"]["sunrise"])
  end
  def sunset_time
    @sunset = Time.at(session_weather["sys"]["sunset"])
  end
  def hours_sun
    @hours_sun = ((@sunset - @sunrise)/3600).round(2)
  end
end
