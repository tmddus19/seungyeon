require 'httparty'
require 'uri'

url ="https://api.telegram.org/bot"
token = "569915118:AAEDw9oroWUANfTPtqA1ZzVZAJe_NTziuhY"

id = "560545727"
msg = URI.encode("오우 대박 배고파")
url + token+"/sendMessage?chat_id=#{id}&text=#{msg}"

#res = HTTParty.get(url + token + "/getMe")
#hash = JSON.parse(res.body)

HTTParty.get(url + token + "/sendMessage?chat_id=#{id}&text=#{msg}")
puts hash