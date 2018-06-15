require 'csv'

yes = 0

CSV.foreach("vote.csv") do |v|
   yes += v[1].to_i
end

puts yes