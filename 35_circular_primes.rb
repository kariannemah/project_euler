require 'prime'

primes = []
Prime.each(1000000) { |prime| primes << prime }

circular_primes = []

primes.each do |n|
  rotations = [n]
  prime_rotations = []

  digits = n.to_s.split("").map{ |s| s.to_i }
  (n.to_s.split("").size - 1).times do |n|
    rotations << digits.rotate!.map{ |i| i.to_s }.join.to_i
  end

  rotations.each do |n|
    prime_rotations << Prime.prime?(n)
  end

  if Prime.prime?(n) && prime_rotations.count(false) == 0
    circular_primes << n
  end
end

puts circular_primes.size
