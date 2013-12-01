# 9 ** 5 ~ 59000
# each digit can only give you 9 ** 5
# for every x-digit number, the sum of all the fifth power of the digits cannot be
# more than x * (9 ** 5)


fifth_powers = []
(1..300000).each do |n|
  numbers = n.to_s.split("").map {|s| s.to_i}
  sum = numbers.inject(0) {|sum, n| sum + n ** 5}
  if sum == numbers.map{|n| n.to_s}.join.to_i
    fifth_powers << sum
  end
end

puts "The numbers that can be written as the sum of fifth powers of
their digits are: #{fifth_powers}."

sum_all = fifth_powers.inject(0) {|sum_all, n| sum_all + n }

puts "The sum of these numbers (not including 1) is: #{sum_all - 1}."
