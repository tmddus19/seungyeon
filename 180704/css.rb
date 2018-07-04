require 'nokogiri'

file = File.open('scrap.html')

html = Nokogiri::HTML(file)
puts html.css("body > div > #name")

#mArticle > div.cont_right > div.section_financetop.section_kospi > dl:nth-child(2) > dd > a > span