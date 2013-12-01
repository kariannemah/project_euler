require 'prime'

array = [1]

(1..500000).each do |n|
  prime_division = n.prime_division
  prime_factors = prime_division.map{|pair| pair[0]}
  if prime_factors.count == 4
    array << n
  end
end

puts "Done with prime factorization."

consecutive_numbers = []

array.each_with_index do |n, index|
  if (array[index] + 1) == array[index + 1] && (array[index] + 2) == array[index + 2] && (array[index] + 3) == array[index + 3]
    consecutive_numbers << n
    break
  end
end

puts "The first number of the first four consecutive integers
to have four distinct prime factors is #{consecutive_numbers[0]}"
