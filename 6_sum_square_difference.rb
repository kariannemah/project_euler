class SumSquareDifference

  def initialize
    @squares_sum = squares_sum
    @square_of_sums = square_of_sums
  end

  def squares_sum
    (1..100).inject(0) { |sum, n| sum + n ** 2 }
  end

  def square_of_sums
    (1..100).reduce(:+) ** 2
  end

  def difference
    square_of_sums - squares_sum
  end
end

difference = SumSquareDifference.new.difference

puts "The difference between the sum of the squares of the first one hundred natural numbers and the square of the sum is #{difference}."