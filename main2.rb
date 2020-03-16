$LOAD_PATH << '.'
require './enumerable_method'
include Enumerable


array_numbers = [15, 8, 9, 34, 7, 8, 90, 8, 3,4]

#puts my_select(array_numbers) 
ar=  my_select(array_numbers) {|x|  x==8 }
puts ar