def hello
    # puts "hello"
    name = " yy "
    puts "Yield 전"
    yield(name)
    puts "Yield 후"
end

#hello() { puts "hello"} #do puts "hello" end 와 같음
hello() do |name|
    puts "hello" + name
end

def bj
    puts "나는 혼자가 좋아"
end

bj() {puts "bj 함께 ㄱㄱ"}