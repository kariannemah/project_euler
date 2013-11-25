powerful_digits = []

exponents = (1..30).to_a

exponents.each do |exponent|
  (1..9).each do |base|
    number = base ** exponent
    if number.to_s.size == exponent
      puts number
      powerful_digits << number
    end
  end
end

puts powerful_digits.count