require 'weather'

class Controller
  def initialize(weather = Weather.new)
    @weather = weather
  end

  def get_data
    data = @weather.get_weather_now
    @weather.sort_data(data.body)
  end
end
