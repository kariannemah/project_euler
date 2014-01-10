numbers = []

File.open("base_exp.txt", "r").each_line do |line|
  numbers << line.split(/\n/)
end

numbers = numbers.flatten.map { |string| string.split(',').map(&:to_i) }

log_of_largest_exponential = 0
index_of_largest_exponential = 0

numbers.each_with_index do |pair, index|
  base = pair[0]
  exponent = pair[1]
  log_of_exponential = exponent * Math.log(base)
  if log_of_exponential > log_of_largest_exponential
    log_of_largest_exponential = log_of_exponential
    index_of_largest_exponential = index
  end
end

line_number_of_largest_exponent = index_of_largest_exponent + 1