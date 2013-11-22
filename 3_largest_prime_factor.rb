require 'prime'

def largest_prime_factor(n)
  n.prime_division.flatten.sort.pop
end


puts largest_prime_factor(600851475143)

