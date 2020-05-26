require 'sinatra'
require_relative 'controller'

get '/test' do
  controller = Controller.new
  controller.get_data
end

post '/new-message' do
  
end
