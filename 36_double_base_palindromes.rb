double_palindromes = []

(1..999999).each do |n|
  string_number = n.to_s
  if string_number == string_number.reverse && n.to_s(2) == n.to_s(2).reverse
  double_palindromes << string_number
end
end

double_palindromes_sum = double_palindromes.inject(0) {|sum, n| sum + n.to_i}

puts "The sum of all numbers, less than one million, which are palindromic in
base 10 and base 2, is: #{double_palindromes_sum}."
