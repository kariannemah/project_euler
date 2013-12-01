require 'prime'

primes = []
smaller_primes = []

Prime.each(9999999) { |n| primes << n }
Prime.each(1234567) { |n| smaller_primes << n }

primes = primes - smaller_primes

prime_pandigitals = []

primes.each do |number|

  digits = number.to_s.split('').map(&:to_i)

  pandigital_check = []

  (1..digits.count).each do |n|
    if ! digits.include? n
      pandigital_check << nil
    else
      pandigital_check << true
    end
  end

  unless pandigital_check.include? nil
    prime_pandigitals << number
  end
end

p prime_pandigitals.sort.pop
