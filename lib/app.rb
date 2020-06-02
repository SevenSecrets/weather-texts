require 'sinatra'
require 'rest-client'
require_relative 'controller'

enable :sessions

get '/' do
  controller = Controller.new
  controller.get_data
end

post '/new-message' do
  message = request.body.read
  controller = Controller.new
  controller.get_data
  controller.compose_message
  # controller.send_message(message.chat.id)
  p JSON.parse(message)
end
