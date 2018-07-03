# boxoffice.json 파일에 있는 내용을 불러와서
# 가지고 놀아보기

require 'json'
require 'awesome_print'

file = File.read('boxoffice.json')
data = JSON.parse(file)
title =  data["cards"][0]["items"][0]["item"]["title"]
#ap data["cards"][0]["items"][0]["item"]
# 1번 과제
genre = data["cards"][0]["items"][0]["item"]["main_genre"]
rate = data["cards"][0]["items"][0]["item"]["filmrate"]
director =data["cards"][0]["items"][0]["item"]["directors"][0]["name"]
poster = data["cards"][0]["items"][0]["item"]["poster"]["original"]

list = data["cards"]

puts title
puts genre
puts rate
puts director
puts poster

# 제목 장르 관람가 감독 포스터

# 2번과제
# json파일 안에는 몇개의 영화가 들어가 있을까
puts list.size
# 3번과제

list.each do|elem|
    movies.push({
        "title" =>elem["items"][0]["item"]["main_genre"],
        "genre" =>elem["items"][0]["item"]["filmrate"],
        "rate" =>elem["items"][0]["item"]["filmrate"],
        "director" =>elem["items"][0]["item"]["directors"][0]["name"],
        "poster" =>elem["items"][0]["item"]["poster"]["original"]
    })
end

puts movies

# movies = [
#     {
#         "title" =>,
#         "genre" =>,
#         "rate" =>,
#         "director" =>,
#         "poster" =>
#     },
#     {
#         "title" =>,
#         "genre" =>,
#         "rate" =>,
#         "director" =>,
#         "poster" =>
#     }
# ]


    # data = {
    #     "cards" => data["cards"][c]["items"][0]["item"]["title"],
    #     "load_more" =>,
    #     "total" => 
    # }
