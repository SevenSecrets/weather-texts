require_relative 'weather'
require_relative 'send_sms'

class Controller
  def initialize(weather = Weather.new, send_sms = SendSMS.new)
    @weather = weather
    @weather_data = {}
    @message = ""
    @send_sms = send_sms
  end

  def get_data
    data = @weather.get_weather_now
    @weather_data = @weather.sort_data(data.body)
  end

  def compose_message
    rain = classify_rain(@weather_data["Precipitation"])
    temperature = @weather_data["Temperature"].to_s
    uv = @weather_data["UV"].to_s
    @message = "The temperature now is " + temperature + "°C, it is " + rain + ", and the UV index is approximately " + uv + "."
  end

  def send_message(message = @message)
    @send_sms.send_message(message)
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
