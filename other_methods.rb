module Enumerable
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

def new_auto_array(first, last)
  autoarray = []
  i = first
  while i <= last
    autoarray << i
    i += 1
  end
  autoarray
end
