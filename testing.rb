$LOAD_PATH << '.'
require './enumerable_method'
require 'test/unit'

include Enumerable

puts [1, 2, 3].my_map { |x| x < 2 }
puts (1..4).my_map { |i| i * i }
puts (1..4).my_map { 'cat' }
puts '========='
puts [1, 2, 3].map { |x| x < 2 }
puts (1..4).map { |i| i * i }
puts (1..4).map { 'cat' }
