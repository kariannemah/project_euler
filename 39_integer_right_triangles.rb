array = []

(1..500).each do |a|
  (1..500).each do |b|
    (1..500).each do |c|
      if c**2 == a**2 + b**2
        array << [a, b, c]
      end
    end
  end
end

perimeters = array.map do |triplet|
  triplet.inject(0) {|sum, n| sum + n }
end

hash = Hash[array.zip(perimeters)]

frequency = Hash[hash.group_by { |k, v| v }.map { |k, v| [k, v.count] }]

puts perimeter_with_most_triplets = frequency.max_by{|k,v| v}
