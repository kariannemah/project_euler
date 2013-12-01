# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330,
# is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit
# numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property,
# but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

require 'prime'

primes_below_upper_bound = []
primes_below_lower_bound = []

Prime.each(9999) do |prime|
  primes_below_upper_bound << prime
end

Prime.each(1000) do |prime|
  primes_below_lower_bound  << prime
end

primes = primes_below_upper_bound - primes_below_lower_bound
sequence = []

primes.each do |n|
  n = n.to_s.split('').map(&:to_i)
  permutations = n.permutation.to_a.map(&:join).map(&:to_i)

  prime_permutations = []

  permutations.each do |number|
    if Prime.prime? number
      prime_permutations << number
    end
  end

  p prime_permutations = prime_permutations.sort

  triplet_combos = prime_permutations.combination(3).to_a

  triplet_combos = triplet_combos.delete_if { |triplet| triplet[0] == triplet[1] }
  triplet_combos = triplet_combos.delete_if { |triplet| triplet[0].to_s.split('').count < 4 }

  triplet_combos.each do |triplet|
    if (triplet[0] - triplet[1]).abs == (triplet[1] - triplet[2]).abs && sequence.count(triplet) == 0
      sequence << triplet
    end
  end
end

sequence = sequence - [[1487, 4817, 8147]]
twelve_digit_number = sequence.flatten.join.to_i
