require 'unirest'
require 'dotenv'
Dotenv.load

class Weather
  def initialize
    @lat = "51.536388"
    @lon = "-0.140556"
    @response = ""
  end

  def get_weather
    response = Unirest.get ("https://api.climacell.co/v3/weather/realtime?lat=" + @lat + "&lon=" + @lon),
    headers:{
      "content-type" => "application/json",
      "apikey" => ENV['CLIMACELL_API_KEY']
    }
    @response = response
    p response
    return response
  end
end
