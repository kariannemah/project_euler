# How many Sundays fell on the first of the month
# during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

puts Date.new(1901,1,1).upto(Date.new(2000,12,31)).find_all { |d| d.mday == 1 && d.wday == 0 }.count