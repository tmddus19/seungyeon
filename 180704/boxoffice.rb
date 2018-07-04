require 'httparty'
require 'json'

base = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
key = "0406c227375495574739b7cf1b2d5e6c"
targetDt = "20180703"

JSON.parse(response.body)
response = HTTParty.get(base + "key=" + key + "&" + "targetDt=" + targetDt)
puts response.body

# 1번 과제
# '마녀'의 정보를 저장한다.
# 순위 rank
# 제목 title
# 누적매출액 sales
# 누적관객수 audi

rank = ["boxOfficeResult"]["dailyBoxOfficeList"][0]["rank"]
title = ["boxOfficeResult"]["dailyBoxOfficeList"][0]["movieNm"]
sales = ["boxOfficeResult"]["dailyBoxOfficeList"][0]["salesAcc"]
audi = ["boxOfficeResult"]["dailyBoxOfficeList"][0]["audiAcc"]

movies = []
data["boxOfficeResult"]["dailyBoxOfficeList"].each do |movie|
    movies.push({
        "rank" => movie["rank"],
        "title" => movie["movieNm"],
        "sales" => movie["salesAcc"],
        "audi" => movie["audiAcc"]
    })
end

puts movies



#2번과제 전체 영화(10개)르 movies 배열에 저장한다.
#movies = [{영화1}, {영화2}, ... ,{영화10}]
#{"rank "=> xxx, "title" => xxx, "sales" => xxx, "audi" => xxx}