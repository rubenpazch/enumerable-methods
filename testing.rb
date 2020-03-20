$LOAD_PATH << '.'
require './enumerable_method'
require 'test/unit'

include Enumerable

puts [10, 50, 100].my_map { |x| x < 20 }
puts [1, 4, 9, 16], (1..4).my_map { |i| i * i }
puts %w[cat cat cat cat], (1..4).my_map { 'cat' }
puts '========='
puts [10, 50, 100].map { |x| x < 20 }
puts [1, 4, 9, 16], (1..4).map { |i| i * i }
puts %w[cat cat cat cat], (1..4).map { 'cat' }
