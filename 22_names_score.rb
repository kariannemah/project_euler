dictionary = ("A".."Z").to_a

file = File.open("names.txt", "r")
list = file.read.split(",").sort
file.close

total_name_score = 0

list.map! do |name|
  letters = name.split("")
  letters.delete("\"")
  letters.join
end

list.each do |name|
  letters = name.split("")
  alphabetical_value = letters.inject(0) do |sum, letter|
    sum + dictionary.index(letter) + 1
  end

  score = alphabetical_value * (list.index(name) + 1)

  total_name_score = score + total_name_score
end

p total_name_score

