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

  def my_all?(param = nil)
    t = true
    if param_is_a_value(param) && !param.nil?
      my_each do |x|
        t = if_a_is_equal_b(x, param)
        break if t == false
      end
    elsif param_is_a_class(param) && !param.nil?
      my_each do |x|
        t = if_elem_owns_to_class(x, param)
        break if t == false
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = if_is_a_reg(x, param)
        break if t == false
      end
    elsif block_given?
      return true unless block_given?

      my_each do |x|
        t = if_is_false_or_null yield(x)
        break if t == false
      end
    else
      my_each do |x|
        t = if_is_false_or_null x
        break if t == false
      end
    end
    t
  end

  def my_any?(param = nil)
    return false if empty?

    t = true
    if param_is_a_value(param) && !param.nil?
      my_each do |x|
        t = if_a_is_equal_b(x, param)
        break if t == true
      end
    elsif param_is_a_class(param) && !param.nil?
      my_each do |x|
        t = if_elem_owns_to_class(x, param)
        break if t == true
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = if_is_a_reg(x, param)
        break if t == true
      end
    elsif block_given?
      return true unless block_given?

      my_each do |x|
        t = if_is_false_or_null yield(x)
        break if t == true
      end
    else
      my_each do |x|
        t = if_is_false_or_null x
        break if t == true
      end
    end
    t
  end

  def my_none?(param = nil)
    t = true
    if param_is_a_value(param) && !param.nil?
      t = false
      my_each do |x|
        t = if_a_is_equal_b_return_false(x, param)
        break if t == false
      end
    elsif param_is_a_class(param) && !param.nil?
      my_each do |x|
        t = if_elem_owns_to_class_return_false(x, param)
        break if t == false
      end
    elsif param.class == Regexp && !param.nil?
      my_each do |x|
        t = if_is_not_a_reg(x, param)
        break if t == true
      end
    elsif block_given?
      return true unless block_given?

      my_each do |x|
        t = if_false_return_true(yield(x))
        break if t == false
      end
    else
      my_each do |x|
        t = if_true_return_false(x)
        break if t == false
      end
    end
    t
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

  def my_inject(param = nil, _default_param = nil)
    if param.class == Symbol
      return nil if length.zero?

      acum = self[0]
      newarray = self[1..length]
      newarray.my_each do |item|
        acum = operation_simbol(param, acum, item)
      end
    elsif self.class == Array
      acum = self[0]
      newarray = self[1..length]
      newarray.my_each do |item|
        acum = yield(item, acum)
      end
    else
      autoarray = []
      i = first
      while i <= last
        autoarray << i
        i += 1
      end
      acum = autoarray[0]
      temparray = autoarray[1..autoarray.length]
      temparray.my_each do |item|
        acum = yield(item, acum)
      end
    end
    acum
  end

  def if_is_false_or_null(elem)
    if elem.nil? || elem == false
      false
    else
      true
    end
  end

  def if_false_return_true(elem)
    t = elem == false
    t
  end

  def if_true_return_false(elem)
    t = elem != true
    t
  end

  def if_elem_owns_to_class(elem, param)
    if elem.is_a? param
      true
    else
      false
    end
  end

  def if_elem_owns_to_class_return_false(elem, param)
    if elem.is_a? param
      false
    else
      true
    end
  end

  def if_elem_not_owns_to_class(elem, param)
    if elem.is_a? param
      false
    else
      true
    end
  end

  def if_nil_acum_mul(param, acum)
    if param.nil?
      acum
    elsif param_is_a_class(param)
      acum
    elsif param_is_a_symbol(param)
      acum
    else
      acum * param
    end
  end

  def if_is_a_reg(param, regexp)
    if param.match(regexp)
      true
    else
      false
    end
  end

  def if_is_not_a_reg(param, regexp)
    if param.match(regexp)
      false
    else
      true
    end
  end

  def if_a_is_equal_b(input_a, input_b)
    input_a == input_b
  end

  def if_a_is_equal_b_return_false(input_a, input_b)
    input_a != input_b
  end

  def param_is_a_class(param)
    if param == Numeric
      true
    elsif param == Float
      true
    elsif param == String
      true
    elsif param == Integer
      true
    else
      param == String
    end
  end

  def param_is_a_symbol(param)
    param == Symbol
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
end
