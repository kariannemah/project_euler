triangle_numbers = []

(1..100).each do |n|
  triangle_number = (1 + n) * n / 2
  triangle_numbers << triangle_number
end

dictionary = ("A".."Z").to_a

file = File.open("words.txt", "r")
words = file.read.split(",")
file.close

triangle_words_count = 0

words.each do |word|
  letters = word.split("")
  letters.delete("\"")

  word_value = letters.inject(0) do |sum, letter|
    numerical_value = dictionary.index(letter) + 1
    sum + numerical_value
  end

  if triangle_numbers.include? word_value
    triangle_words_count = triangle_words_count + 1
  end
end

puts triangle_words_count
