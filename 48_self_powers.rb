series = (1..1000).inject(0) {|sum, n| sum + n ** n}

last_ten_digits = series.to_s.split("").pop(10).join.to_i
