=begin
The palindromic number 595 is interesting because it can be written as
the sum of consecutive squares: 62 + 72 + 82 + 92 + 102 + 112 + 122.

  There are exactly eleven palindromes below one-thousand that can be
 written as consecutive square sums, and the sum of these palindromes
 is 4164. Note that 1 = 02 + 12 has not been included as this problem
 is concerned with the squares of positive integers.

Find the sum of all the numbers less than 10**8 that are both palindromic
 and can be written as the sum of consecutive squares.
=end

class Integer
  def square
    self * self
  end

  def palindrome?
    self == self.to_s.reverse.to_i
  end
end

palindromes = []
(1..7100).each do |a|
  (1..a-1).each do |b|
    sum = (b..a).map { |n| n.square }.reduce(:+)
    if sum.between?(0, 10 ** 8) && sum.palindrome?
      palindromes << sum
    end
  end
end

p palindromes.uniq.reduce(:+)
