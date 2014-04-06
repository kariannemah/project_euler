# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles:
# Although there exists no rectangular grid that contains exactly two million rectangles, find the area of
# the grid with the nearest solution.

number_of_desired_rectangles = 2_000_000

(1..100).each do |x|
  (1..x).each do |y|
    number_of_rectangles = (x ** 2 + x)*(y ** 2 + y)/4
    difference = (number_of_rectangles - number_of_desired_rectangles).abs
    if difference < 100
      puts x * y
    end
  end
end
