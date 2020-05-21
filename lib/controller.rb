require 'weather'

class Controller
  def initialize(weather = Weather.new)
    @weather = weather
    @weather_data = {}
    @message = ""
  end

  def get_data
    data = @weather.get_weather_now
    @weather_data = @weather.sort_data(data.body)
  end

  def compose_message
    rain = classify_rain(@weather_data["Precipitation"])
    temperature = @weather_data["Temperature"]
    uv = @weather_data["UV"]
  end

  def classify_rain(rain = @weather_data["Precipitation"])
    if rain > 50
      return "raining violently"
    elsif rain > 10
      return "raining heavily"
    elsif rain > 2.5
      return "raining moderately hard"
    elsif rain > 0
      return "lightly raining"
    end
    return 'not raining'
  end
end
