require './each_methods'
require './boolean_methods'
require './general_methods'

module Enumerable
  def my_select
    return to_enum(:my_select) unless block_given?

    newarray = []
    my_each do |x|
      newarray << x if yield(x) == true
    end
    newarray
  end

  def my_count(item = nil)
    counter = 0
    if item.nil?
      return length unless block_given?

      each do |x|
        counter += 1 if yield(x)
      end
    else
      my_each do |y|
        counter += 1 if y == item
      end
    end
    counter
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    newarray = []
    if self.class == Array
      my_each do |x|
        newarray << if yield x
                      true
                    else
                      false
                    end
      end
    else
      i = first
      while i <= last
        newarray << yield(i) unless yield(i).nil?
        i += 1
      end
    end
    newarray
  end

  def operate_inject_for_simbol(acum, newarray, param)
    newarray.my_each do |item|
      acum = operation_simbol(param, acum, item)
    end
    acum
  end

  def new_auto_array(first, last)
    autoarray = []
    i = first
    while i <= last
      autoarray << i
      i += 1
    end
    autoarray
  end

  def my_inject(param = nil, _default_param = nil)
    if param.class == Symbol
      return nil if length.zero?

      acum = operate_inject_for_simbol(self[0], self[1..length], param)
    elsif self.class == Array
      acum = self[0]
      newarray = self[1..length]
      newarray.my_each do |item|
        acum = yield(item, acum)
      end
    else
      autoarray = new_auto_array(first, last)
      acum = autoarray[0]
      temparray = autoarray[1..autoarray.length]
      temparray.my_each do |item|
        acum = yield(item, acum)
      end
    end
    acum
  end

  def multiply_elns(numbers)
    numbers.my_inject do |number, product|
      number * product
    end
  end

  def my_map_proc(&block)
    return to_enum(:my_map) unless block_given?

    newarray = []
    i = first
    while i <= last
      newarray << block.call(i) unless block.call(i).nil?
      i += 1
    end
    newarray
  end
end
