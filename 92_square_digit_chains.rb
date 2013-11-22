RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true,
                                               trace_instruction:     false }

RubyVM::InstructionSequence.new(<<end).eval

  def square_digit(n, chain_numbers = [n])

  split_number = n.to_s.split('').map {|s| s.to_i}

  square_digit = split_number.inject(0) { |sum, n| sum + n ** 2}

    if !chain_numbers.include? square_digit
      chain_numbers << square_digit
      square_digit(square_digit, chain_numbers)
    elsif square_digit == 1
      chain_numbers
    else
      return 89
    end
  end
end

eighty_nine_counter = 0

(1..10_000_000).each do |n|

  square_digit(n)

  if square_digit(n) == 89
    eighty_nine_counter = eighty_nine_counter + 1
  end
end

p eighty_nine_counter


