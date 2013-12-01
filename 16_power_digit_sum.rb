product = 2 ** 1000

array_of_digits = product.to_s.split('').map { |s| s.to_i}

sum_of_digits = array_of_digits.inject(0) { |sum, n| sum + n }

puts sum_of_digits
