require 'rest-client'
require 'dotenv'
Dotenv.load

class SendMessage
  def initialize
    @telegramAPI = ENV['TELEGRAM_API_KEY']
    @message = ""
  end

  def send_message(message, chat_id = "none")
    header = { chat_id: chat_id, text: message }
    begin
      RestClient.post("https://api.telegram.org/bot" + @telegramAPI + "/sendMessage", {}, header)
    rescue RestClient::ExceptionWithResponse => e
      p e.response
    end
    p "message sent"
  end
end
