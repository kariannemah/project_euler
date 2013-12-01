array = [1,2]

while array[-1] < 4000000 do
  array << array[-1] + array[-2]
end

array.inject(0) { |n| sum + n if n.even? }

p sum
