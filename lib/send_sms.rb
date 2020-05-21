require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SendSMS
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV['TWILIO_FROM_NO']
    @to = ENV['YOUR_PHONE_NO']
    @message = ""
  end

  def send_message(message)
    @client.messages.create(from: @from, to: @to, body: message)
  end
end
