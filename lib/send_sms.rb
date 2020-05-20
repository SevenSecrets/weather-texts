require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+???' # Your Twilio number
to = '+???' # Your mobile phone number

client.messages.create(
  from: from,
  to: to,
  body: "Hey friend!"
)
