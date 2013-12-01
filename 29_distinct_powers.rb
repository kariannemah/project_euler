terms = []
(2..100).each do |x|
  (2..100).each do |y|
    term = x ** y
    terms << term
  end
end

p terms.sort.uniq.count
