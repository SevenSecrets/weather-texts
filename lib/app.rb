require 'sinatra'
require_relative 'controller'

get '/' do
  controller = Controller.new
  controller.get_data
end
