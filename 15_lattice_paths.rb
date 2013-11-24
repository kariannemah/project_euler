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

grid_length = 20
path_length = grid_length * 2


numerator = factorial(path_length)
denominator = factorial(grid_length) * factorial(path_length - grid_length)

puts number_of_routes = numerator / denominator