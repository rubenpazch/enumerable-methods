$LOAD_PATH << '.'
require './enumerable_method'

def multiply_els(numbers)
  numbers.my_inject do |number, product|
    number * product
  end
end

puts multiply_els([1, 2, 3, 4])
puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
puts %w[ant bear cat].my_none? { |word| word.length == 5 }

ary = [1, 2, 4, 2]
ary.my_count(&:even?)

puts [1, 2, 3].my_inject(4) { |prod, n| prod * n } # should provide me 24 but got 6
puts (1...4).my_inject(:+) # should return 6
puts (1...4).my_inject(1, :+) # should return 7
puts (1..4).my_map { |i| i * i }
puts (1..4).my_map_proc { |i| i * i }
