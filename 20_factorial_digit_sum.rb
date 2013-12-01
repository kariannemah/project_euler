def factorial_digit_sum(number)
  product = 1
  (1..number).each do |n|
    product = n * product
  end
  array_of_digits = product.to_s.split("")
  array_of_digits = array_of_digits.map {|s| s.to_i}
  sum_of_digits = 0
  array_of_digits.each { |n| sum_of_digits = sum_of_digits + n}
  puts "The sum of the digits of #{number}! is #{sum_of_digits}."
end

factorial_digit_sum(100)
