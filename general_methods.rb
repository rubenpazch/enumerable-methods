module Enumerable
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
    elsif param == Symbol
      acum
    else
      acum * param
    end
  end

  def operate_inject_for_simbol(acum, newarray, param)
    newarray.my_each do |item|
      acum = operation_simbol(param, acum, item)
    end
    acum
  end
end
