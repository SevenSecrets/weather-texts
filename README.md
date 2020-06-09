# Weather Reminders

This app texts me to tell me what the weather is like, including temperature, rain, and (since I'm ginger and forget to wear suncream far too often) UV index.
The app currently runs on Heroku and is pinged by a Telegram bot every time someone messages it, responding with the sorted data gathered from the Climacell API about the weather conditions at a location. Currently that location is static, but I am working on adding a feature that allows a user to send their location data to the Telegram bot and use that instead of the LAT/LON environment variables.

## Using the app

### Setup 
First, run bundle in order to set up all the gems. You will then need to create a .env file in the root folder, in which you should store all of the private keys and phone numbers which are used by the Twilio and Climacell APIs:
```
CLIMACELL_API_KEY="YOUR CLIMACELL API KEY HERE"
TELGRAM_API_KEY="YOUR TELEGRAM API KEY HERE"
LAT="YOUR LATITUDE"
LON="YOUR LONGITUDE"
```
### Running the app 
By default, all you need to do in order to run the app from here is to run `ruby ./lib/app.rb`, but I would recommend running the test suite via `rspec` first in order to identify any possible issues.

When run, the app will be accessible on port 5678 and can receive get requests to '/' in order to simply display a message containing the weather data or post requests (via the Telegram bot API) to '/new-message' in order to respond with the sorted weather data.

The app is currently running at `https://morning-island-67647.herokuapp.com/`, returning data for Camden Town, if you want to check it out. Alternatively, use the bot on Telegram: [@artemis_weather_alert_bot](https://t.me/artemisweatheralertbot).
