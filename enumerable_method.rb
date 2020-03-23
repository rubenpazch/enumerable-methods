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
        newarray << yield(x) ? true : false
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

  def new_auto_array(first, last)
    autoarray = []
    i = first
    while i <= last
      autoarray << i
      i += 1
    end
    autoarray
  end

  def my_inject(_default_param = nil, param = nil)
    if _default_param.class == Symbol && param.nil? && self.class == Range
      autoarray = new_auto_array(0, last - 1)
      acum = autoarray[0]
      acum = operate_inject_for_simbol(acum, autoarray, _default_param)
    elsif _default_param.class == Symbol && param.nil?
      return nil if length.zero?

      acum = operate_inject_for_simbol(self[0], self[1..length], _default_param)
    elsif param.class == Symbol && !_default_param.nil? && self.class == Range
      autoarray = new_auto_array(0, last - 1)
      acum = autoarray[0]
      acum = operate_inject_for_simbol(acum, autoarray, param)
      acum = operation_simbol(param, acum, _default_param)
    elsif param.class == Symbol && !_default_param.nil?
      return _default_param if empty?

      autoarray = new_auto_array(0, last - 1)
      acum = autoarray[0]
      acum = operate_inject_for_simbol(acum, autoarray, param)
      acum = operation_simbol(param, acum, _default_param)
    elsif param_is_a_value(_default_param) && !_default_param.nil? && param.nil? && self.class == Range
      return raise 'The number 4 is not a symbol or string' unless block_given?

      autoarray = new_auto_array(first, last)
      acum = autoarray[0]
      temparray = autoarray[1...autoarray.length]
      temparray.my_each { |item| acum = yield(item, acum) }
      acum = yield(acum, _default_param)
    elsif param_is_a_value(_default_param) && !_default_param.nil? && param.nil?
      return raise 'The number 4 is not a symbol or string' unless block_given?

      acum = self[0]
      newarray = self[1..length]
      newarray.my_each { |item| acum = yield(item, acum) }
      acum = yield(acum, _default_param)
    elsif self.class == Array
      acum = self[0]
      newarray = self[1..length]
      newarray.my_each { |item| acum = yield(item, acum) }
    else
      autoarray = new_auto_array(first, last)
      acum = autoarray[0]
      temparray = autoarray[1..autoarray.length]
      temparray.my_each { |item| acum = yield(item, acum) }
    end
    acum
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
