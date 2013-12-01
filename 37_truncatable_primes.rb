require 'prime'

primes = []

Prime.each(800_000) do |prime|
  primes << prime
end

trunctable_primes = []

solo_primes = [2, 3, 5, 7]

primes.each do |n|

  children = []
  array = n.to_s.split("").map{|s| s.to_i}
  reversed_array = array.reverse

  (1..array.length).each do |n|
    forward_numbers = array.take(n).each { |i| i.to_s }.join.to_i
    reversed_numbers = reversed_array.take(n).reverse.each { |i| i.to_s }.join.to_i
    children << forward_numbers
    children << reversed_numbers
  end

  children = children.uniq

  prime_check = children.map {|n| true if Prime.prime?(n)}

  if prime_check.uniq.length == 1
    trunctable_primes << n
  end
end

trunctable_primes = trunctable_primes - solo_primes

puts trunctable_primes.inject(0) {| sum, n| sum + n }
