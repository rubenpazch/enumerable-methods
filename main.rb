$LOAD_PATH << '.'
require './enumerable_method'

def multiply_els(numbers)
  numbers.my_inject do |number, product|
    number * product
  end
end

# puts multiply_els([1,2,3,4])
# puts [1, 2, 3, 4].inject(:+)
# puts [1, 2, 3, 4].inject(:*)
# puts [1, 2, 3, 4].inject(:/)
# puts (1..4).inject(&:+)
# puts [1, 2, 3].inject(&:+)
# puts [].inject(:+)
# puts (0...4).inject(0, &:+)
# puts (0...5).inject(0, &:+)
# puts (0...6).inject(0, &:+)

# puts [1, 2, 3, 4].inject(1, &:+)
# puts (1...5).inject(1, :+) 
# puts (1...5).inject(5, :+)
# puts [1, 2 , 3].inject(4){ |prod, n| prod * n }
# puts (1...4).inject(:+)
# puts [1,2,3,4,5].inject(5){|sum,n| sum + n}
# puts [1, 2, 3].inject(&:+)
 # [].inject(0, :+)
 #puts [].inject( :+)
 #puts (1...4).inject(1, :+)
 puts (5..10).inject(1) { |product, n| product * n }
 puts "=================="
# puts [1, 2, 3, 4].my_inject(:+)
# puts [1, 2, 3, 4].my_inject(:*)
# puts [1, 2, 3, 4].my_inject(:/)
# puts (1..4).my_inject(&:+)
# puts [1, 2, 3].my_inject(&:+)
# puts [].my_inject(:+)
# puts (0...4).my_inject(0, :+)
# puts (0...5).my_inject(0, :+)
# puts (0...6).my_inject(0, :+)

#puts [1, 2, 3, 4].my_inject(1, &:+)
# puts (1...5).my_inject(1, :+)
# puts (1...5).my_inject(5, :+)
# puts [1, 2 , 3].my_inject(4){ |prod, n| prod * n }
# puts (1...4).my_inject(:+)
# puts [1,2,3,4,5].my_inject(5){|sum,n| sum + n}
# puts [1, 2, 3].my_inject(&:+)
# puts [].my_inject(0, :+)
# puts [].my_inject(:+)
#puts (1...4).my_inject(1, :+)
puts (5..10).my_inject(1) { |product, n| product * n }