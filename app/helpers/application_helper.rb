module ApplicationHelper
<<<<<<< HEAD
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
=======

  def session_weather
      if session[:weather].present?
        return session[:weather]
      else
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
>>>>>>> 1eed318fb46052049001d4d0866c6c3831ec8935
  end
  def hours_sun
    @hours_sun = ((@sunset - @sunrise)/3600).round(2)
  end
end
