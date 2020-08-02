require 'rest-client'
require 'dotenv'
require 'json'
Dotenv.load

class Weather
  def initialize
    @lat = ENV['LAT']
    @lon = ENV['LON']
    @response_data = ""
    @sorted_data = ""
  end

  def get_weather_now(apikey = ENV['CLIMACELL_API_KEY'])
    response = RestClient.get("https://api.climacell.co/v3/weather/realtime?lat=" + @lat + "&lon=" + @lon + "&fields=temp%2Cprecipitation%2Csurface_shortwave_radiation",
    headers={
      "content-type": "application/json",
     "apikey": apikey
    })
    @response_data = JSON.parse(response)
  end

  def sort_data(response_data = @response_data)
    sorted_data = Hash.new
    precipitation = response_data["precipitation"]["value"]
    temperature = response_data["temp"]["value"]
    uv = (response_data["surface_shortwave_radiation"]["value"] / 25)
    sorted_data.store("Precipitation", precipitation)
    sorted_data.store("Temperature", temperature)
    sorted_data.store("UV", uv)
    return sorted_data
  end
end
