require 'prime'

hash = Hash.new {}

a_values = (-999..999).to_a

b_values = []
Prime.each(1000) do |prime|
  b_values << prime
end

a_values.each do |a|
  b_values.each do |b|
    consecutive_primes = []
    n = 0
    until (n ** 2 + a * n + b).prime? == false
      consecutive_primes << n ** 2 + a * n + b
      n += 1
    end
    coefficients_product = a * b
    hash[coefficients_product] = consecutive_primes.count
  end
end

# Find the product of the coefficients, a and b, for the
# quadratic expression that produces the maximum number of
# primes for consecutive values of n, starting with n = 0.
product_of_a_and_b = hash.sort_by{|k,v| v}.pop.shift
