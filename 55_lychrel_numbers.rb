RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true,
                                               trace_instruction:     false }

RubyVM::InstructionSequence.new(<<end).eval

  def palindrome(n, counter = 0)

    sum = n + n.to_s.reverse.to_i

    if sum.to_s != sum.to_s.reverse
      if counter < 50
        counter = counter + 1
        palindrome(sum, counter)
      else
        return "Lychrel"
      end
    end
  end
end


lychrel_count = 0

(1..10000).each do |n|

  palindrome(n)

  if palindrome(n) == "Lychrel"
    lychrel_count = lychrel_count + 1
  end

end

p "There are #{lychrel_count} Lychrel numbers below ten-thousand."