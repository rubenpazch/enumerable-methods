$LOAD_PATH << '.'
require './enumerable_method'
include Enumerable


array_numbers = ["ant", "bear","car"]
array2 = [nil, false]
array3 = [nil, false, true]
array4 = []
array5 = [1,3.14,42]

array6 = [1,2,4,2]

=begin
puts  my_none?(array_numbers) {|x| x.length==5}
puts  my_none?(array_numbers) {|x| x.length>=4}
puts  my_none?(array_numbers) 
puts  my_none?(array2) 
puts  my_none?(array4) 
puts  my_none?(array5) {Float}
puts  my_none?(array3) 
=end

puts  my_count(array6, nil) 
puts  my_count(array6, 2) 
puts  my_count(array6, nil) {|x| x%2==0}