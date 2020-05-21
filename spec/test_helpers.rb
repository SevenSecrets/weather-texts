def setup_controller_weather_doubles
  weather_double = double('weather')
  response_double = double('response_data')
  response_body = {
    "temp" => {
      "value" => 22
    },
    "precipitation" => {
      "value" => 0
    },
    "surface_shortwave_radiation" => {
      "value" => 12
    }
  }
  allow(response_double).to receive(:body) { response_body }
  allow(weather_double).to receive(:get_weather_now) { response_double }
  allow(weather_double).to receive(:sort_data) { {
    "Precipitation" => 0,
    "Temperature" => 22,
    "UV" => 12
  } }
  @controller = Controller.new(weather_double)
end
