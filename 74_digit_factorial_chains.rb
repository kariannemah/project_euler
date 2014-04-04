=begin
DIGITAL FACTORIAL CHAINS
The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:

1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169; it turns out that there are only three such loops that exist:
                                                                                                                                                                                                169 → 363601 → 1454 → 169
871 → 45361 → 871
872 → 45362 → 872

It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,

78 → 45360 → 871 → 45361 (→ 871)
540 → 145 (→ 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting number below one million is sixty terms.

=end

RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true,
  trace_instruction:     false }

RubyVM::InstructionSequence.new(<<end).eval

  def factorial(n, product = n)
    if n == 0
      product = 1
    elsif n == 1
      product
    else
      product *= (n-1)
      factorial(n-1, product)
    end
  end

  @digit_factorials = (0..9).to_a.map { |n| factorial(n) }

  def digital_factorial_sum(n)
    n.to_s.split('').map(&:to_i).map {|n| @digit_factorials[n]}.reduce(:+)
  end

  def chain_length(n, chain = [n])
    next_term = digital_factorial_sum(n)

    if ! chain.include? next_term
      chain << next_term
      chain_length(next_term, chain)
    else
      chain.count
    end
  end
end

p (1..1000000).to_a.select { |n| chain_length(n) == 60 }.count

# TODO:
# - find the solution more quickly
#   - implement the swing algorithm?
#   - http://www.luschny.de/math/factorial/scala/FactorialScalaCsharp.htm

