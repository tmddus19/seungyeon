#1.파일을 만든다. 100개만
#  - 특정폴더로 들어간다.
#  - 파일을 만든다.
#2.파일들(100게)의 이름을 수정한다.

puts Dir.pwd

Dir.chdir("files")
# 20. times do|x|
# File.open("list.text", "w" do |f|
#     f.write("이건 테스트 파일입니다.")
#     end
# end

name = "john"
puts "hello # {name} nice to meet you"

