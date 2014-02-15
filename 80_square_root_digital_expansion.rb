# In order to expand the irrational square roots to one
# hundred decimal digits, I implemented the algorithm
# described in the paper, "Square roots by subtraction"
# http://www.afjarvis.staff.shef.ac.uk/maths/jarvisspec02.pdf

perfect_squares = []
(1..10).each do |n|
  perfect_squares << n * n
end

numbers_with_irrational_roots = (1..100).to_a - perfect_squares

digital_sums = []

numbers_with_irrational_roots.each do |n|
  a = 5 * n
  b = 5

  until b.to_s.split('').length == 105
    if a >= b
      a = a - b
      b = b + 10
    else
      a = (a.to_s + '00').to_i
      b = b.to_s.split('').insert(-2, '0').join.to_i
    end
  end

  decimal_digits = b.to_s.split('').map(&:to_i)
  first_hundred_decimal_digits = decimal_digits[0..99]
  digital_sum = first_hundred_decimal_digits.reduce(:+)
  digital_sums << digital_sum
end

p total_sum = digital_sums.reduce(:+)
