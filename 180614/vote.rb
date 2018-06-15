require 'csv'

CSV.open("vote.csv","w+") do |v|  # w+읽기쓰기 가능
    v << ["yerim",1]
    v << ["changwon",1]
    v << ["jongwon",0]
    v << ["hongsuk",0]
    v << ["dahye",1]
    v << ["tiger",1]
end
