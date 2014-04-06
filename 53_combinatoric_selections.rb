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
end



factorials = (1..100).to_a.map { |n| factorial(n) }

number_of_values_over_one_million = 0

(1..100).each do |n|
  (1..n).each do |r|
    numerator = factorials[n - 1]
    denominator = factorials[r - 1] * factorials[n - r - 1]
    combinations = numerator / denominator.to_f
    if combinations > 1_000_000
      number_of_values_over_one_million += 1
    end
  end
end

puts number_of_values_over_one_million
