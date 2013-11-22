def pythagorean_triplet_product
  (1..500).each do |a|
    (1..500).each do |b|
      (1..500).each do |c|
        if a + b + c == 1000 && c ** 2 == a ** 2 + b ** 2
          return a * b * c
        end
      end
    end
  end
end

product = pythagorean_triplet_product

puts "There exists exactly one Pythagorean triplet for which a + b + c = 1000. The product abc is #{product}."