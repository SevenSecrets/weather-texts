require_relative 'controller'

controller = Controller.new

while true do
  controller.get_data
  controller.compose_message
  controller.send_message
  p "message sent"
  sleep(86400)
end
