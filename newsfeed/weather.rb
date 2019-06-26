require 'json'
require 'net/http'

#weather calls
def open_weather_api(city, countrycode, apikey)
	#instant
	url = 'http://api.openweathermap.org/data/2.5/weather?q='+city+ ','+countrycode + '&units=imperial'+ '&APPID='+ apikey
	uri = URI(url)
	response = Net::HTTP.get(uri)
	JSON.parse(response)
end

def get_weather_info(open_weather_json)
	return get_temp(open_weather_json) +"\n" + get_precipitation(open_weather_json)
end

def get_temp(open_weather_json)
	return "Temperature: low " + open_weather_json["main"]["temp_min"].to_s + ", high " +  open_weather_json["main"]["temp_max"].to_s
end

def get_precipitation(open_weather_json)
	return "Conditions: " + open_weather_json["weather"][0]["description"].to_s
end

def execute	
	apikey = '6e084ca54e87878d83b476433826ef8c'
	puts 'Current weather:'
	puts get_weather_info(open_weather_api('urbana', 'usa', apikey))
end

execute
