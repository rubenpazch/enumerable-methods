require './general_methods'

module Enumerable
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
end
