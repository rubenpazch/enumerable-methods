# rubocop:disable Metrics/ModuleLength
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < length
      yield (self[i])
      i += 1
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
  end

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

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def my_all?(param = nil)
    t = true
    if block_given?
      return true unless block_given?

      my_each do |x|
        t = yield(x).nil? || yield(x) == false ? false : true
        break if t == false
      end
    elsif param.class == Class && !param.nil?
      my_each do |x|
        t = x.is_a?(param) ? true : false
        break if t == false
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = x.match(param) ? true : false
        break if t == false
      end
    else
      my_each do |x|
        t = x == param
        break if t == false
      end
    end
    t
  end

  def my_any?(param = nil)
    return false if empty?

    t = true
    if block_given?
      return true unless block_given?

      my_each do |x|
        t = yield(x).nil? || yield(x) == false ? false : true
        break if t == true
      end
    elsif param.class == Class && !param.nil?
      my_each do |x|
        t = x.is_a?(param) ? true : false
        break if t == true
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = x.match(param) ? true : false
        break if t == true
      end
    else
      my_each do |x|
        t = x == param
        break if t == true
      end
    end
    t
  end

  def my_none?(param = nil)
    t = true
    if block_given?
      return true unless block_given?

      my_each do |x|
        t = yield(x) == false
        break if t == false
      end
    elsif param.class == Class && !param.nil?
      my_each do |x|
        t = x.is_a?(param) ? false : true
        break if t == false
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = x.match(param) ? false : true
        break if t == true
      end
    else
      t = false
      return false if length.zero? && param.nil?

      my_each do |x|
        t = x != true || x != param
        break if t == false
      end
    end
    t
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def my_inject(initial_value = nil, param = nil)
    if initial_value.class == Symbol && param.nil? && self.class == Range
      autoarray = (0..last - 1).my_map { |i| i }
      acum = autoarray[0]
      acum = operate_inject_for_simbol(acum, autoarray, initial_value)
    elsif initial_value.class == Symbol && param.nil?
      return nil if length.zero?

      acum = operate_inject_for_simbol(self[0], self[1..length], initial_value)
    elsif param.class == Symbol && !initial_value.nil? && self.class == Range
      autoarray = (0..last - 1).my_map { |i| i }
      acum = autoarray[0]
      acum = operate_inject_for_simbol(acum, autoarray, param)
      acum = operation_simbol(param, acum, initial_value)
    elsif param.class == Symbol && !initial_value.nil?
      return initial_value if empty?

      autoarray = (0..last - 1).my_map { |i| i }
      acum = autoarray[0]
      acum = operate_inject_for_simbol(acum, autoarray, param)
      acum = operation_simbol(param, acum, initial_value)
    elsif param_is_a_value(initial_value) && !initial_value.nil? && param.nil? && self.class == Range
      return raise 'The number 4 is not a symbol or string' unless block_given?

      autoarray = (first..last).my_map { |i| i }
      acum = autoarray[0]
      temparray = autoarray[1...autoarray.length]
      temparray.my_each { |item| acum = yield(item, acum) }
      acum = yield(acum, initial_value)
    elsif param_is_a_value(initial_value) && !initial_value.nil? && param.nil?
      return raise 'The number 4 is not a symbol or string' unless block_given?

      acum = self[0]
      newarray = self[1..length]
      newarray.my_each { |item| acum = yield(item, acum) }
      acum = yield(acum, initial_value)
    elsif self.class == Array
      acum = self[0]
      newarray = self[1..length]
      newarray.my_each { |item| acum = yield(item, acum) }
    else
      autoarray = (first..last).my_map { |i| i }
      acum = autoarray[0]
      temparray = autoarray[1..autoarray.length]
      temparray.my_each { |item| acum = yield(item, acum) }
    end
    acum
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

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

  def param_is_a_value(param)
    if param == Numeric
      false
    elsif param == String
      false
    elsif param == Integer
      false
    elsif param == Float
      false
    else
      param.class != Regexp
    end
  end

  def operation_simbol(param, elem_a, elem_b)
    if param.to_s == '+'
      elem_a + elem_b
    elsif param.to_s == '*'
      elem_a * elem_b
    elsif param.to_s == '-'
      elem_a - elem_b
    else
      elem_a / elem_b
    end
  end

  def operate_inject_for_simbol(acum, newarray, param)
    newarray.my_each do |item|
      acum = operation_simbol(param, acum, item)
    end
    acum
  end
end
# rubocop:enable Metrics/ModuleLength

# print arr.my_inject(2){|a,b| a + b}

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
