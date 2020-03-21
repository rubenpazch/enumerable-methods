module Enumerable
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
