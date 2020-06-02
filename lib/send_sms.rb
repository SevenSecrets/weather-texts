require 'rest-client'
require 'dotenv'
Dotenv.load

class SendMessage
  def initialize
    @telegramAPI = ENV['TELEGRAM_API_KEY']
    @message = ""
  end

  def send_message(message, chat_id = "none")
    begin
      RestClient.post("https://api.telegram.org/bot" + @telegramAPI + "/sendMessage", { chat_id: chat_id, text: message }.to_json, { content_type: :json })
    rescue RestClient::ExceptionWithResponse => e
      p JSON.parse(e.response)
    end
    p "message sent"
  end
end
