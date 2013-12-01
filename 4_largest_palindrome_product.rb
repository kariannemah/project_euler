factors = [0, 0]
palindrome = []

(1..999).to_a.reverse_each do |x|
  (1..999).to_a.reverse_each do |y|
    product = x * y
    palindrome << product if product.to_s == product.to_s.reverse
    factors = [x,y] if product.to_s == product.to_s.reverse
    break if x < factors.min
  end
end

puts palindrome.max
