require 'controller'

describe Controller do
  it 'exists' do
    controller = Controller.new
    expect(controller).to be_instance_of Controller
  end

  describe 'receiving data from weather class tests' do
    before(:each) do
      weather_double = double('weather')
      response_double = double('response_data')
      response_body = {
        "temp" => {
          "value" => 18
        },
        "precipitation" => {
          "value" => 0
        },
        "surface_shortwave_radiation" => {
          "value" => 15
        }
      }
      allow(response_double).to receive(:body) { response_body }
      allow(weather_double).to receive(:get_weather_now) { response_double }
      allow(weather_double).to receive(:sort_data) {{
        "Precipitation" => 0,
        "Temperature" => 18,
        "UV" => 15
      }}
      @controller = Controller.new(weather_double)
    end

    it 'receives data from the weather class' do
      expect(@controller.get_data).to include "Temperature" && "Precipitation" && "UV"
    end
  end
end
