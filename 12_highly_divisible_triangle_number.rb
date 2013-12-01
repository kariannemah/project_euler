require 'prime'

triangle_numbers = []
(12_000..12_500).each do |n|
  triangle_number = (1 + n) * n / 2
  triangle_numbers << triangle_number
end

triangle_numbers.sort.reverse

hash = Hash.new

triangle_numbers.each do |t|
  divisors = []

  (1..t-1).each do |n|
    if t % n == 0
      divisors << n
    end
  end

  if divisors.count > 500
    hash.merge! t => divisors.count
  end
end

