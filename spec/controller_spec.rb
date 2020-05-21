require 'controller'
require 'test_helpers'

describe Controller do
  it 'exists' do
    controller = Controller.new
    expect(controller).to be_instance_of Controller
  end

  describe 'receiving data from weather class tests' do
    before(:each) do
      setup_controller_weather_doubles
    end

    it 'receives data from the weather class' do
      expect(@controller.get_data).to include "Temperature" && "Precipitation" && "UV"
    end

    it 'works out how much it is raining' do
      @controller.get_data
      expect(@controller.classify_rain).to eq "not raining"
    end
  end

  describe 'message tests' do
    before(:each) do
      setup_controller_weather_doubles
      @controller.get_data
    end

    it 'composes a message' do
      expect(@controller.compose_message).to eq "The temperature now is 22°C, it is not raining, and the UV index is 12."
    end
  end
end
