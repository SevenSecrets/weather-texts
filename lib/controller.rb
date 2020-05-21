require 'weather'

class Controller
  def initialize(weather = Weather.new)
    @weather = weather
    @weather_data = []
  end

  def get_data
    data = @weather.get_weather_now
    @weather_data = @weather.sort_data(data.body)
  end
end
