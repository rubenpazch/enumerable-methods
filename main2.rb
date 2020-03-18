$LOAD_PATH << '.'
require './enumerable_method'
include Enumerable

#[1,3.14,42].my_each {|x| puts x}
#[1,3.14,42].my_each 
#[1,3.14,42].my_each_with_index { |x, y| puts " #{x}, #{y}" }
#puts [1,2,3,4,5].my_select {|x| x.even?}
#puts %w[ant bear cat].my_all? {|word| word.length>=3}
#puts %w[ant bear cat].my_all? {|word| word.length>=4}
#puts %w[ant bear cat].my_all?(/t/)
#puts [1,2i,3.14].my_all?(Numeric)
#puts [nil,true,99].my_all?
#puts [].my_all?
#puts %w[ant bear cat].my_any? {|word| word.length>=3}
#puts %w[ant bear cat].my_any? {|word| word.length>=4}
#puts %w[ant bear cat].my_any?(/t/)
#puts [1,2i,3.14].my_any?(Numeric)
#puts [nil,true,99].my_any?
#puts [].my_any?

#puts %w[ant bear cat].my_none? {|word| word.length==5}
#puts %w[ant bear cat].my_none? {|word| word.length>=4}
#puts [1,3.14,42].my_none?(Float)
#puts [].my_none?
#puts [nil].my_none?
#puts [nil,false].my_none?

#puts [1,2,4,2].my_count
#puts [1,2,4,2].my_count(2)
#puts [1,2,4,2].my_count{|x|x%2==0}

#puts [1,2,4,2].my_inject { |sum, n| sum + n }   
#puts [1,2,4,2].my_inject { |sum, n| sum * n }   
#puts (5..10).my_inject { |sum, n| sum * n } 
#puts (5..10).my_inject { |sum, n| sum + n } 
#longest = %w{ cat sheep bear }.inject do |memo, word|
#	memo.length > word.length ? memo : word
#end
#puts longest  


#puts (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
#puts (1..4).my_map_proc { |i| i*i }      #=> [1, 4, 9, 16]

#puts multiply_elns([1,2,3,4,5])


#puts (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
puts (1..4).my_map_proc #=> [1, 4, 9, 16]