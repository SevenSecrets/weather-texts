require 'weather'

describe Weather do
  it 'exists' do
    weather = Weather.new
    expect(weather).to be_instance_of Weather
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
          "value" => 12
        }
      }
      allow(@response_data).to receive(:body) { response_body }
    end

    it 'returns the temp, precipitation, and uv' do
      expect(@weather.sort_data(@response_data.body)).to include "Temperature" && "Precipitation" && "UV"
    end
  end
end
