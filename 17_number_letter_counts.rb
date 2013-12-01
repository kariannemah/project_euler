# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

# Zach's guess: 15,000
# Andy's guess: 21,500

dictionary = {
              0 => "",
              1 => "one",
              2 => "two",
              3 => "three",
              4 => "four",
              5 => "five",
              6 => "six",
              7 => "seven",
              8 => "eight",
              9 => "nine",
              10 => "ten",
              11 => "eleven",
              12 => "twelve",
              13 => "thirteen",
              14 => "fourteen",
              15 => "fifteen",
              16 => "sixteen",
              17 => "seventeen",
              18 => "eighteen",
              19 => "nineteen",
              20 => "twenty",
              30 => "thirty",
              40 => "forty",
              50 => "fifty",
              60 => "sixty",
              70 => "seventy",
              80 => "eighty",
              90 => "ninety",
              100 => "onehundred",
              200 => "twohundred",
              300 => "threehundred",
              400 => "fourhundred",
              500 => "fivehundred",
              600 => "sixhundred",
              700 => "sevenhundred",
              800 => "eighthundred",
              900 => "ninehundred",
              1000 => "onethousand"
              }

AND = 3

sum = 0
1.upto(1000) do |n|
  split_number = n.to_s.split('').map{|s| s.to_i}
  if n > 100 && n % 100 > 10 && n % 100 < 20
    hundreds_value = split_number[0] * 100
    teens = n % 100
    number_of_chars = dictionary[hundreds_value].length + AND + dictionary[teens].length
    sum += number_of_chars
  elsif n > 100 && n >= 20 && n % 100 != 0
    hundreds_value = split_number[0] * 100
    tens_value = split_number[1] * 10
    ones_value = split_number[2]
    number_of_chars = dictionary[hundreds_value].length + AND + dictionary[tens_value].length + dictionary[ones_value].length
    sum += number_of_chars
  elsif split_number.size == 2 && n > 20
   tens_value = split_number[0] * 10
   ones_value = split_number[1]
   number_of_chars = dictionary[tens_value].length + dictionary[ones_value].length
   sum += number_of_chars
  else
    sum += dictionary[n].length
  end
end
puts "#{sum} letters would be used if 1 to 1000 inclusive were written out."
