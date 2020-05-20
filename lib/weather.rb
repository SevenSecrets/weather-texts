require 'unirest'

class Weather
  def initialize
    @lat = "51.536388"
    @long = "-0.140556"
  end

  def get_weather
    response = Unirest.get ("https://climacell-microweather-v1.p.rapidapi.com/weather/realtime?fields=precipitation&unit_system=si&lat=" + @lat + "&lon=" + @long),
    headers:{
      "X-RapidAPI-Host" => "climacell-microweather-v1.p.rapidapi.com",
      "X-RapidAPI-Key" =>   "b539b02a3amsh89287e4a386d572p1066b7jsnfc69e67435b2"
    }
  end
end
