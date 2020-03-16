$LOAD_PATH << '.'
require './enumerable_method'
include Enumerable

puts 'Choose an option'
puts 'Type 1 -> custom my_each '
puts 'Type 2 -> custom my_each_with_index '
puts 'Type 3 -> custom my_select '
puts 'Type 4 -> custom my_all '
puts 'Type 5 -> custom my_any '
puts 'Type 6 -> custom my_none '
puts 'Type 6 -> custom my_count '
print "\r"

option = gets.chomp.to_i
array_numbers = [15, 8, 9, 34, 7, 8, 90]
array_strings = ["ant","bear","cat"]

case option
when 1
  print "\r"
	my_each(array_numbers) { |x| puts x.to_s }
when 2  
  print "\r"
	my_each_with_index(array_numbers) { |x, y| puts " #{x}, #{y}" }
when 3 
  print "\r"
	newarray=  my_select(array_numbers) {|x|  x>=8 }
	puts newarray.inspect
when 4
	arr4= %w[ant bear cat]
	print "\r"	
	r = my_all?(arr4){|n| n.length>=4}
	puts r
when 5
	arr5= %w[ant bear cat]
	print "\r"	
	r = my_any?(arr5){|n| n.length>=4}
	puts r
when 6
	arr6= %w[ant bear cat]
	print "\r"	
	puts my_none?(arr6){|n| n.length==5}
	puts my_none?(arr6){|n| n.length>=4}
when 7
	arr6= %w[ant bear cat]
	print "\r"	
	puts my_count(arr6){|n| n.length==5}
	puts my_count(arr6){|n| n.length>=4}
else
  puts 'wrong option'
end
