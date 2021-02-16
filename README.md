# Weather Reminders

[![Build Status](https://travis-ci.org/SevenSecrets/weather-texts.png?branch=master)](https://travis-ci.org/SevenSecrets/weather-texts)


This app texts me to tell me what the weather is like, including temperature, rain, and (since I'm ginger and forget to wear suncream far too often) UV index.
The app currently runs on Heroku and is pinged by a Telegram bot every time someone messages it, responding with the sorted data gathered from the Climacell API about the weather conditions at a location. If the user sends a location in the Telegram message, via the "Send my current location" feature, then the weather returned is for that location, otherwise it defaults to Kentish Town.

The app runs on Sinatra, because it's far easier to get something like this up and running using a fairly barebones setup rather than using a whole Rails project, especially since there's no database interaction. The main issues I faced while building it were related to accessing and using the Telegram API, which I was entirely new to and took some getting used to. I initially intended to have this app send you an SMS every day or something along those lines, but realised that I didn't want to have to pay a subscription fee to a service for what is essentially a hobby and learning project, so setting it up to work via request through the Telegram API is perfect.

The app is currently running on [heroku](https://morning-island-67647.herokuapp.com/), returning data for Kentish Town, if you want to check it out. Alternatively, use the bot on Telegram: [@artemis_weather_alert_bot](https://t.me/artemisweatheralertbot). The Telegram bot is probably preferable, as you can send it your location directly and it will give you information for that location. rather than just Kentish Town.

## Using the app

### Setup 
First, run `bundle install` in order to set up all the gems. You will then need to create a .env file in the root folder, in which you should store all of the private keys and phone numbers which are used by the Twilio and Climacell APIs in this format:
```
CLIMACELL_API_KEY="YOUR CLIMACELL API KEY HERE"
TELGRAM_API_KEY="YOUR TELEGRAM API KEY HERE"
LAT="YOUR LATITUDE"
LON="YOUR LONGITUDE"
```
### Running the app 
By default, all you need to do in order to run the app from here is to run `ruby ./lib/app.rb`, but I would recommend running the test suite via `rspec` first in order to identify any possible issues.

When run, the app will be accessible on port 5678 and can receive get requests to the root in order to simply display a message containing the weather data or post requests (via the Telegram bot API) to '/new-message' in order to respond with the sorted weather data.
