# Triangle      Tn=n(n+1)/2       1, 3, 6, 10, 15, ...
# Pentagonal      Pn=n(3n−1)/2      1, 5, 12, 22, 35, ...
# Hexagonal       Hn=n(2n−1)      1, 6, 15, 28, 45, ...

# It can be verified that T285 = P165 = H143 = 40755.

# Find the next triangle number that is also pentagonal and hexagonal.

tri_pent_hex_numbers = []

triangle = (1..100000).map { |n| n * (n + 1) / 2 }

pentagonal = (1..100000).map { |n| n * (3 * n - 1) / 2 }

hexagonal = (1..100000).map { |n| n * (2 * n - 1) }

triangle.each do |n|
  if (pentagonal.include? n) && (hexagonal.include? n) && n > 40755
    puts n
    break
  end
end
