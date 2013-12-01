# What is the smallest odd composite that cannot
# be written as the sum of a prime and twice a square?

require 'prime'
odd_composites = []
(1..10_000).each do |n|
  if !n.even? && !Prime.prime?(n)
   odd_composites << n
  end
end

non_goldbach_numbers = []

odd_composites.each do |number|
  test = []

  upper_bound = (number/2) ** 1/2 - 1
  (1..upper_bound).each do |i|
    difference = (number - 2 * i ** 2)
    if difference > 0 && Prime.prime?(difference)
      test << number
    end
  end

  if test.count == 0
     non_goldbach_numbers << number
  end
end

non_goldbach_numbers.delete(1)
p non_goldbach_numbers[0]
