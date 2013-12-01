digit_factorials = []
(1..50000).each do |n|

  number = n.to_s.split("").map {|s| s.to_i}

  factorials = number.map do |n|
    if n == 0
      1
    else
      (1..n).inject(:*)
    end
  end

  sum_of_factorial_digits = factorials.inject(0) {|sum, n| sum + n}

  if sum_of_factorial_digits == number.map{|n| n.to_s}.join.to_i
    digit_factorials << sum_of_factorial_digits
  end
end

digit_factorials = digit_factorials.drop(2)

puts digit_factorials.inject(0) {|sum, n| sum + n}


