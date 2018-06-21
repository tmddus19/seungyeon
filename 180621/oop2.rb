class Numeric
    def to_bitcoin
        self * 7515000
    end
end

puts 50.to_bitcoin

class String
    def yell
        self + "!!"
    end
end

puts "ya".yell