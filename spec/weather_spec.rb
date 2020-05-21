require 'weather'

describe Weather do
  it 'exists' do
    weather = Weather.new
    expect(weather).to be_instance_of Weather
  end

  describe 'getting api data tests' do
    before(:each) do
      @weather = Weather.new
    end

    it 'sends a request to the climacell api' do
      #this sends a request but the response has nothing useful in it on purpose because I'm not testing the response
      expect(@weather.get_weather_now("fakeapikey")).to be_truthy
    end
  end

  describe 'sorting response data' do
    before(:each) do
      @weather = Weather.new
      @response_data = double('response_data')
      response_body = {
        "temp" => {
          "value" => 22
        },
        "precipitation" => {
          "value" => 0
        },
        "surface_shortwave_radiation" => {
          "value" => 302
        }
      }
      allow(@response_data).to receive(:body) { response_body }
    end

    it 'returns the temp, precipitation, and uv' do
      expect(@weather.sort_data(@response_data.body)).to include "Temperature" && "Precipitation" && "UV"
    end
  end
end
