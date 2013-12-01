digit_cancelling_fractions = []
denominators = (11..99).to_a

denominators_without_zeroes = denominators - denominators.select {|num | num % 10 == 0}

(11..99).each do |numerator|
  denominators_without_zeroes.each do |denominator|
    numerator_digits = numerator.to_s.split('').map { |s| s.to_i}
    denominator_digits = denominator.to_s.split('').map { |s| s.to_i}
      if denominator > numerator && numerator_digits[0] == denominator_digits[1] && Rational(numerator_digits[1], denominator_digits[0]) == Rational(numerator,denominator)
        digit_cancelling_fractions << Rational(numerator , denominator)
      elsif denominator > numerator && numerator_digits[1] == denominator_digits[0] && Rational(numerator_digits[0], denominator_digits[1]) == Rational(numerator,denominator)
        digit_cancelling_fractions << Rational(numerator , denominator)
      else
        nil
      end
  end
end

product = digit_cancelling_fractions.inject(1) {|product, n| product * n}

p "The four non-trivial examples of digit cancelling fractions are: #{digit_cancelling_fractions}."
p "The product of these four fractions in its lowest common terms is #{product}."
p "The value of the denominator is: #{product.denominator}"

