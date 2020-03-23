$LOAD_PATH << '.'
require './enumerable_method'

def multiply_els(numbers)
  numbers.my_inject do |number, product|
    number * product
  end
end

puts multiply_els([1, 2, 3, 4])
