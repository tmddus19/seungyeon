require 'httparty'
require 'pp'
require 'json'

days = ["mon", "tue", "wed", ]
all_webtoons = []

days.each do |day|
    url = "http://webtoon.daum.net/data/pc/webtoon/list_serialized/#{day}"
    response = HTTParty.get(url) # file = File.read(boxoffice.json)
    data = JSON.parse(response.body) # response 안에 들어있는 json을 루비 해시로 바꾸겠다.
    # pp data
    # pp data.keys # 사용가능한 키를 보여줌 result, data

    data["data"].each do |webtoon| # 배열 안의 요소는 해쉬
        all_webtoons.push({
            "title" => webtoon["title"],
            "introduction"  => webtoon["introduction"]
        })
    end
end

all_webtoons.each do |w|
    puts w["title"]
    puts w["introduction"]
end

webtoon = {
    # :title => data["data"][0]["title"],
    title: data["data"][0]["title"],
    appThumbnailImage: data["data"][0]["appThumbnailImage"]["url"],
    introduction: data["data"][0]["introduction"],
    genres1: data["data"][0]["cartoon"]["genres"][0]["name"],
    genres2: data["data"][0]["cartoon"]["genres"][1]["name"],
    averageScore: data["data"][0]["averageScore"]
}

# pp title
# pp data["data"].size 
# pp webtoon

c470d8e41ae224d53d7ecbc644dd5f88