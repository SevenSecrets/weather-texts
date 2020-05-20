require 'weather'

describe Weather do
  it 'exists' do
    weather = Weather.new
    expect(weather).to be_instance_of Weather
  end

  describe 'getting darksky data tests' do
    before(:each) do
      @weather = Weather.new
    end

    it 'sends a request to the climacell api' do
      expect(@weather.get_weather).to be_truthy
    end
  end
end
