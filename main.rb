$LOAD_PATH << '.'
require './enumerable_method'

def multiply_els(numbers)
  numbers.my_inject do |number, product|
    number * product
  end
end

# examples test cases for the custom methods

def select_even(numbers)
  numbers.my_select(&:even?)
end

def check_if_all_numbers_up_to_100(numbers)
  numbers.my_all? { |word| word >= 100 }
end

# p [1, 2, 3].my_inject { |sum, b| sum + b }
# p [1,2,3].inject(1) { |product, n| product * n }
# p [1,2,3].my_inject(1) { |product, n| product * n }
# puts '================='
# p [1,2,3].inject { |product, n| product * n }
# p [1,2,3].my_inject { |product, n| product * n }
# puts '================='
# p (5..10).inject(1) { |product, n| product * n }
# p (5..10).my_inject(1) { |product, n| product * n }
# puts '================='
# p (5..10).inject { |product, n| product * n }
# p (5..10).my_inject { |product, n| product * n }
# puts '================='
# p [1, 2, 3].inject(4) { |prod, n| prod * n }
# p [1, 2, 3].my_inject(4) { |prod, n| prod * n }
# puts '================='
# p (5..10).inject { |sum, n| sum + n }
# p (5..10).my_inject { |sum, n| sum + n }
# puts '================='
# p [1, 2, 3].inject(4) { |prod, n| prod * n }
# p [1, 2, 3].my_inject(4) { |prod, n| prod * n }
# puts '================='
# p [1, 2, 3, 4].inject(:*)
# p [1, 2, 3, 4].my_inject(:*)
# puts '================='
# p [1, 2, 3, 4].inject(:+)
# p [1, 2, 3, 4].my_inject(:+)
# puts '================='
# puts [].inject(:+)
# #puts [].my_inject(:+)

# puts (1...4).inject(:+)
# puts (1...4).my_inject(:+)

# p [1, 2, 3].inject { |prod, n| prod * n }
# p [1, 2, 3].my_inject { |prod, n| prod * n }

# puts multiply_els([1, 2, 3, 4, 5])
# puts select_even([1, 2, 3, 4, 5, 6, 7, 8, 9]).inspect
# puts check_if_all_numbers_up_to_100([10, 20, 300, 400, 500, 60, 70, 800, 9]).inspect

# p [1, true, 'hi', []].my_all?
# p %w[ant bear cat].my_all? { |word| word.length >= 4 }
# p %w[ant bear cat].my_all?(/t/)

# p (1...4).inject(1, :+)
# p (1...4).my_inject(1, :+)
#
# p (1...4).inject(1, :*)
# p (1...4).my_inject(1, :*)

# p (1...4).inject(1, :/)
# p (1...4).my_inject(1, :/)

# 0+1+2+3+1

# p (5..10).my_inject(2, :*)
# p (0..10).my_inject(2, :*)
# p (1..10).my_inject(2, :*)
#
# p (5..10).inject(2, :*)
# p (0..10).inject(2, :*)
# p (1..10).inject(2, :*)

# p [3, 3, 3].my_all?(3)
# p [nil, false, nil, false].any?
# p [nil, false, true, false].any?
# p [nil, true, 99].any?
# p [nil, 88, 99].any?
# p [77, 88, 99].any?
# arr = [3, 4, 6, 8, 7]
# hash = { a: 1, b: 2 }

# print arr.my_inject(2) { |a, b| a + b }

# TEST

# arr.my_each{|item| puts item.to_s}
# hash.my_each{|item| puts item.to_s}

# arr.my_each_with_index { |v, i| puts "#{v} at index #{i}" }
# hash.my_each_with_index { |k, v, i| puts "#{k}: #{v} at index #{i}" }

# print [1, 2, 2, 3, 5, 8, 9].my_select(&:odd?)
# print hash.my_select { |k, v| v > 1 }

# print arr.my_all?(/\D/)
# print arr.my_all?(String)
# print hash.my_all? { |k, v| v.is_a? Integer }
# print hash.my_all?(/\d/)

# print arr.my_any?
# print [1, 2, nil, 3, 5, 8, 9].my_any? { |v| v || v.nil? }
# print arr.my_any?(/\d/)

# print arr.my_none?
# print [1, 2, nil, 3, 5, 8, 9].my_none? { |v| v || v.nil? }
# print arr.my_none?(/\d/)

# print arr.my_count
# print arr.my_count(2)
# print arr.my_count{ |x| x%2==0 }

# test = Proc.new { |i| i*i }
# print arr.my_map( &test)
# print arr.my_map { |i| i*i }

# print [1,2,3,4,5].my_inject{|a,b| a+b}

# print multiply_els(arr)
