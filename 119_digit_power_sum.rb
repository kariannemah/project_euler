# The number 512 is interesting because it is equal to the sum of its digits raised to some power: 5 + 1 + 2 = 8, and 83 = 512. Another example of a number with this property is 614656 = 284.

# We shall define an to be the nth term of this sequence and insist that a number must contain at least two digits to have a sum.

# You are given that a2 = 512 and a10 = 614656.

# Find a30.

def sum_of_digits(n)
  digits = n.to_s.split(//).map(&:to_i)
  digits.inject(0) { |sum, digit| sum + digit}
end

sequence = []

(2..200).each do |base|
  (2..20).each do |power|
    n = base ** power
    if n > 9 && sum_of_digits(n) == base
      sequence << n
    end
  end
end

sequence.sort[29]