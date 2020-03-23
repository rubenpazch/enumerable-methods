$LOAD_PATH << '.'
require './enumerable_method'

def multiply_els(numbers)
  numbers.my_inject do |number, product|
    number * product
  end
end

def select_even(numbers)
  numbers.my_select(&:even?)
end

def check_if_all_numbers_up_to_100(numbers)
  numbers.my_all? { |word| word >= 100 }
end

puts multiply_els([1, 2, 3, 4, 5])
puts select_even([1, 2, 3, 4, 5, 6, 7, 8, 9]).inspect
puts check_if_all_numbers_up_to_100([10, 20, 300, 400, 500, 60, 70, 800, 9]).inspect
