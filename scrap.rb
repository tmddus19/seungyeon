require "httparty"
require "nokogiri"

#1. naver에 원하는 정보가 담긴 페이지를 요청한다.
#2. 네이버에게 받은 문서 안에 있는 원하는 정보를 빼온다.
#3. 빼온 정보를 출력한다.

headers = {
  'User-Agent': 'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; ko-KR))'
} 

res = HTTParty.get("https://search.naver.com/search.naver?where=nexearch&sm=top_sug.pre&fbm=1&acr=3&acq=ghksdbf&qdt=0&ie=utf8&query=%ED%99%98%EC%9C%A8", headers: headers)
val = Nokogiri::HTML(res).css("#_cs_foreigninfo > div > div.contents03_sub > div > div.c_rate > div.rate_bx > div.rate_spot._rate_spot > div.rate_tlt > h3 > a > span.spt_con.dw > strong")
puts val