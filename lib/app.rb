require 'sinatra'
require 'rest-client'
require_relative 'controller'

enable :sessions

get '/' do
  controller = Controller.new
  controller.get_data
end

post '/new-message' do
  message = JSON.parse(request.body.read)
  if message["message"]["location"]
    lat = message["message"]["location"]["latitude"]
    long = message["message"]["location"]["longitude"]
  end
  controller = Controller.new
  controller.get_data(lat, lon)
  reply = controller.compose_message
  controller.send_message(message["message"]["chat"]["id"], reply)
end
