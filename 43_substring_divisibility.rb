# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

#     d2d3d4=406 is divisible by 2
#     d3d4d5=063 is divisible by 3
#     d4d5d6=635 is divisible by 5
#     d5d6d7=357 is divisible by 7
#     d6d7d8=572 is divisible by 11
#     d7d8d9=728 is divisible by 13
#     d8d9d10=289 is divisible by 17

# Find the sum of all 0 to 9 pandigital numbers with this property.

substring_divisible_pandigitals_sum = 0
substring_divisible_pandigitals = []

pandigital_digits = 1_406_357_289.to_s.split('').map { |s| s.to_i }

permutations = pandigital_digits.permutation.to_a

permutations.each do |array|
  array = array.map { |i| i.to_s }
  first_set = array[1..3].join.to_f.to_i
  second_set = array[2..4].join.to_f.to_i
  third_set = array[3..5].join.to_f.to_i
  fourth_set = array[4..6].join.to_f.to_i
  fifth_set = array[5..7].join.to_f.to_i
  sixth_set = array[6..8].join.to_f.to_i
  seventh_set = array[7..9].join.to_f.to_i

  if first_set % 2 == 0 && second_set % 3 == 0 && third_set % 5 == 0 && fourth_set % 7 == 0 && fifth_set % 11 == 0 && sixth_set % 13 == 0 && seventh_set % 17 == 0
    substring_divisible_pandigitals << array.join.to_i
  end
end

substring_divisible_pandigitals_sum = substring_divisible_pandigitals.inject(0) { |sum, n| sum + n }

puts substring_divisible_pandigitals_sum
