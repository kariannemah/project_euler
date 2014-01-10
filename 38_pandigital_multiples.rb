longest_concatenated_product = 0
   
(1..99999).each do |a|
  string = ""
  (1..9).each do |b|
    string += (a * b).to_s
    if string.length == 9 && string.split('').sort.join == "123456789"
      if string.to_i > longest_concatenated_product
        longest_concatenated_product = string.to_i 
      end
    elsif string.length > 9
      break
    end
  end
end
   
puts longest_concatenated_product

