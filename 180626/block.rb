numbers = [1, 2, 3, 4, 5]
str_numbers = []
# block : 코드의 묶음
# 1. {}
# 2. do ... end
numbers.map! {|num| num += 5} 

puts numbers