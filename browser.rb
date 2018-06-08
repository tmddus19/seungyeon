#launchy 친구를 불러온다.
#launchy에게 브라우저 열어달라고 한다.

require "launchy"
require "uri"

keywords = ["daum", "google", "facebook"]

url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="
keyword = keywords[0]

n = 0
while (n < 3)
    #반복시킬 문장
    Launchy.open(url + keywords[n])
    n = n + 1
end

keywords.each do |key|
    Launchy.open(url + key)
end
