=begin
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

=end

RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true,
                                               trace_instruction:     false }


RubyVM::InstructionSequence.new(<<end).eval

  def collatz(n, ary = [n])
    if n.even?
      ary << n/2
      collatz(n/2, ary)
    elsif n != 1
      ary << 3 * n + 1
      collatz(3 * n + 1, ary)
    else
      ary
    end
  end

end

length_of_biggest_chain = 0
starting_number = 0

(1..1_000_000).each do |n|
  sequence_count = collatz(n).count
  if sequence_count > length_of_biggest_chain
    length_of_biggest_chain = sequence_count
    starting_number = n
  end
end

p starting_number
