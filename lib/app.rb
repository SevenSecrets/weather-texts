require 'sinatra'
require 'rest-client'
require 'dotenv'
require_relative 'controller'

Dotenv.load

enable :sessions

get '/' do
  controller = Controller.new
  controller.get_data(ENV["LAT"], ENV["LON"])
end

post '/new-message' do
  message = JSON.parse(request.body.read)
  if message["message"]["location"]
    lat = message["message"]["location"]["latitude"].to_s
    lon = message["message"]["location"]["longitude"].to_s
  else
    lat = ENV["LAT"]
    lon = ENV["LONG"]
  end
  controller = Controller.new
  controller.get_data(lat, lon)
  reply = controller.compose_message
  controller.send_message(message["message"]["chat"]["id"], reply)
end
