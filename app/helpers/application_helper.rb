module ApplicationHelper
  def weather_object
      if session[:weather].present? && session[:weather]["cod"].to_i == 200
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
    @main_weather =  weather_object["weather"].first["main"]
  end
  def weather_description
    @description =  weather_object["weather"].first["description"]
  end
  def temperature
    @temperature = weather_object["main"]["temp"]
  end
  def temp_max
    @temp_max =  weather_object["main"]["temp_max"]
  end
  def temp_min
    @temp_min =  weather_object["main"]["temp_min"]
  end
  def humidity
    @humidity =  weather_object["main"]["humidity"]
  end
  def wind_speed
    @wind_speed =  weather_object["wind"]["speed"]
  end
  def clouds
    @clouds =   weather_object["clouds"]["all"]
  end
  def sunrise_time
    @sunrise = Time.at( weather_object["sys"]["sunrise"])
  end
  def sunset_time
    @sunset = Time.at( weather_object["sys"]["sunset"])
  end
  def hours_sun
    @hours_sun = ((@sunset - @sunrise)/3600).round()
  end
end

def weather_icon_change
    case weather_object["weather"].first["icon"]
    when "01d"
      "day-sunny"
    when "02d"
      "day-cloud"
    when "03d"
      "cloudy"
    when "04d"
      "cloudy"
    when "09d"
      "day-showers"
    when "10d"
      "rain-mix"
    when "11d"
      "day-thunderstorm"
    when "13d"
      "day-snow-wind"
    when "01n"
      "night-clear"
    when "02n"
      "night-alt-cloudy"
    when "03n"
      "cloud"
    when "04n"
      "cloudy"
    when "09n"
      "night-showers"
    when "10n"
      "night-alt-rain"
    when "11n"
      "night-thunderstorm"
    when "13n"
      "night-alt-snow"
    end
end
