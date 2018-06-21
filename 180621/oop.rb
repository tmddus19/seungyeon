module Move
    def walk
        puts "뚜벅"
    end
end

class Person
    @@number = 0
    def initialize(name,age,gender)
        @name = name
        @age = age
        @gender = gender
        @@number += 1
    end
    attr_accessor :name, :age, :gender
    
    def Person.number
        @@number
    end
end

hongsuk = Person.new("홍석" ,"28","male")
y = Person.new("예림" ,"27","female")
d1 = Person.new("동현" ,"27","male")
d2 = Person.new("동현" ,"27","male")
d3 = Person.new("동현" ,"27","male")

puts Person.number



