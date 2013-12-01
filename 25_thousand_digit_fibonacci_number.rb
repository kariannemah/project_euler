array = [1,1]

until array[-1].to_s.split("").count == 1000 do
  array << array[-1] + array[-2]
end

puts "The first time in the Fibonacci sequency to contain
1000 digits is the #{array.size}nd term. It's value is #{array[-1]}."

