$LOAD_PATH << '.'
require './enumerable_method'
include Enumerable

puts 'Choose an option'
puts 'Type 1 -> custom my_each '
puts 'Type 2 -> custom my_each_with_index '
puts 'Type 3 -> custom my_select '
puts 'Type 4 -> custom my_all '
puts 'Type 5 -> custom my_any '
print "\r"

option = gets.chomp.to_i
array_numbers = [15, 8, 9, 34, 7, 8, 90]

case option
when 1
  print "\r"
	my_each(array_numbers) { |x| puts x.to_s }
when 2  
  print "\r"
	my_each_with_index(array_numbers) { |x, y| puts " #{x}, #{y}" }
when 3 
  print "\r"
	newarray= my_select(array_numbers) { |x | x==8 }
	puts newarray
when 4
	arr4= %w[ant bear cat]
	print "\r"	
	r = my_all?(arr4){|n| n.length>=4}
	puts r
when 5
	arr5= %w[ant bear cat]
	print "\r"	
	r = my_all?(arr5){|n| n.length>=3}
	puts r

else
  puts 'wrong option'
end

