require 'prime'

def find_prime(ordinal_number)
  Prime.take(ordinal_number).pop
end


puts find_prime(10001)