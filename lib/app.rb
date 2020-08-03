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
  p message["message"]["location"]
  controller = Controller.new
  controller.get_data
  reply = controller.compose_message
  controller.send_message(message["message"]["chat"]["id"], reply)
end
