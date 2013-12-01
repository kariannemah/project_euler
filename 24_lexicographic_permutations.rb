digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

permutations = digits.permutation.to_a

permutations = permutations.map do |number|
  number.map do |i|
    i.to_s
  end
  number.join.to_i
end

puts permutations[999999]
