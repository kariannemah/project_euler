
pentagonal_numbers = (1..3000).map { |n| (3 * n - 1) * n / 2 }

differences_between_pentagonal_pairs = []

pentagonal_numbers.each do |j|
  pentagonal_numbers.each do |k|
    p sum = j + k
    p difference = k - j
    absolute_difference = difference.abs

    if (pentagonal_numbers.include? absolute_difference) && (pentagonal_numbers.include? sum)
      differences_between_pentagonal_pairs << [j, k, absolute_difference]
    end
  end
end

differences_between_pentagonal_pairs = differences_between_pentagonal_pairs.uniq

differences_between_pentagonal_pairs.map { |array| array[2] }.sort.shift

