pp "howdy"

require "http"
require "json"

pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")

gmaps_api_key = ENV.fetch("GMAPS_KEY")


pp "Where are you?"
user_location = gets.chomp 


gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + gmaps_api_key

resp = HTTP.get(gmaps_url)

raw_response = resp.to_s

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

pp latitude
pp longitude
