require 'rest-client'
require 'dotenv'
Dotenv.load

class SendMessage
  def initialize
    # @account_sid = ENV['TWILIO_ACCOUNT_SID']
    # @auth_token = ENV['TWILIO_AUTH_TOKEN']
    # @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    # @from = ENV['TWILIO_FROM_NO']
    # @to = ENV['YOUR_PHONE_NO']
    @telegramAPI = ENV['TELEGRAM_API_KEY']
    @message = ""
  end

  def send_message(message, chat_id = "none")
    header = { chat_id: chat_id, text: message }
    RestClient.post("https://api.telegram.org/bot" + @telegramAPI + "/sendMessage", {}, header)
    p "message sent"
  end
