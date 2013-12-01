permuted_multiples = []

(100000..170000).each do |x|
  x_digits = x.to_s.split('').map {|s| s.to_i}.sort
  two_x_digits = (x * 2).to_s.split('').map {|s| s.to_i}.sort
  three_x_digits = (x * 3).to_s.split('').map {|s| s.to_i}.sort
  four_x_digits = (x * 4).to_s.split('').map {|s| s.to_i}.sort
  five_x_digits = (x * 5).to_s.split('').map {|s| s.to_i}.sort
  six_x_digits = (x * 6).to_s.split('').map {|s| s.to_i}.sort

  if [x_digits,two_x_digits, three_x_digits, four_x_digits, five_x_digits, six_x_digits].uniq.length == 1
    permuted_multiples << x
  end
end

permuted_multiples.sort
puts permuted_multiples[0]
