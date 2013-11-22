# Find the sum of all the primes below two million

require 'prime'

primes = []
Prime.each(2_000_000) do |n|
  primes << n
end

prime_sum = primes.inject(0) {|sum, n| sum + n}

puts "The sum of all the primes below 2 million is #{prime_sum}."