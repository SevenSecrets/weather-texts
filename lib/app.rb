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
  controller = Controller.new
  controller.get_data
  controller.compose_message
  # controller.send_message(message.chat.id)
  p message
  p "BREAK"
  p "BREAK"
  p "BREAK"
  p message["message"]["chat"]
end
