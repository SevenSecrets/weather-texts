#Weather Reminders

This app texts me to tell me what the weather is like, including temperature, rain, and (since I'm ginger and forget to wear suncream far too often) UV index.

##Using the app

###Setup
First, run `bundle` in order to set up all the gems. You will then need to create a `.env` file in the root folder, in which you should store all of the private keys and phone numbers which are used by the Twilio and Climacell APIs:

```
CLIMACELL_API_KEY="YOUR CLIMACELL API KEY HERE"
TWILIO_ACCOUNT_SID="YOUR TWILIO ACCOUNT SID HERE"
TWILIO_AUTH_TOKEN="YOUR TWILIO AUTH TOKEN HERE"
TWILIO_FROM_NO="YOUR TWILIO PHONE NUMBER HERE"
YOUR_PHONE_NO="THE PHONE NUMBER YOU WISH TO SEND TEXTS TO HERE"
```
###Running the app
By default, all you need to do in order to run the app from here is to run `ruby ./lib/app.rb`, but I would recommend running the test suite via `rspec` first in order to identify any possible issues.

Running the app like this will send a text message to your chosen phone number containing the temperature, amount of rain, and UV index at the current time. By default this will be for Camden Town, London (because that's where I am), but this can be overridden by passing the ******COMPLETE HERE******.

