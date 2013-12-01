=begin
Digit factorial chains
Problem 74

The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:

169 → 363601 → 1454 → 169
871 → 45361 → 871
872 → 45362 → 872

It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

69 → 363600 → 1454 → 169 → 363601 (→ 1454)
78 → 45360 → 871 → 45361 (→ 871)
540 → 145 (→ 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?
=end

RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true,
                                               trace_instruction:     false }


RubyVM::InstructionSequence.new(<<end).eval

  def factorial(n, result = 1)
    if n == 1
      result
    else
      factorial(n - 1, n * result)
    end
  end

  chain_numbers = []

  def factorial_chain(n, chain_numbers = [n])

    number_split = n.to_s.split('').map {|s| s.to_i}
    sum_of_factorials = number_split.inject(0) { |sum, i| sum + factorial(i) }

    if chain_numbers.count(sum_of_factorials) == 0
      chain_numbers << sum_of_factorials
      factorial_chain(sum_of_factorials, chain_numbers)
    else
      p chain_numbers
    end
  end
end

starter_numbers = []
number_of_chains = starter_numbers.size

(1..1_000_000).each do |n|
  chain_numbers << n
  factorial_chain(n, chain_numbers)
    if chain_numbers.size == 60
      starter_numbers << n
    end
end

puts "There are #{number_of_chains} numbers that produce chains of sixty non-repeating numbers.
These starting numbers are : #{starter_numbers}."
