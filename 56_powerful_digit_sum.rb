digital_sums = []

(1..99).each do |a|
  (1..99).each do |b|
    product = a ** b
    digits = product.to_s.split('').map { |s| s.to_i }
    digital_sum = digits.inject(0) { |sum, n| sum + n }
    digital_sums << digital_sum
  end
end

puts digital_sums.sort.pop
