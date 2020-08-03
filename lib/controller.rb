require_relative 'weather'
require_relative 'send_sms'

class Controller
  def initialize(weather = Weather.new, send_message = SendMessage.new)
    @weather = weather
    @weather_data = {}
    @message = ""
    @send_message = send_message
  end

  def get_data(lat, lon)
    data = @weather.get_weather_now(lat, lon)
    @weather_data = @weather.sort_data(data)
  end

  def compose_message
    rain = classify_rain(@weather_data["Precipitation"])
    temperature = @weather_data["Temperature"].to_s
    uv = @weather_data["UV"].to_s
    @message = "The temperature now is " + temperature + "°C, it is " + rain + ", and the UV index is approximately " + uv + "."
  end

  def send_message(chat_id = "none", message = @message)
    @send_message.send_message(message, chat_id)
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
