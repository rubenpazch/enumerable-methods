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
		return false if param.class == Regexp

    t = true
    if block_given?
			return true unless block_given?

			my_each do |x|				
				t = if_nil_false_return_false (yield(x))
				break if t==false
      end
    else
      if param.nil?
        my_each do |x|
					t = if_nil_false_return_false (x)
					break if t==false
        end
      else
        my_each do |x|          
					t = if_is_a_class(x,param)
					break if t ==false
        end
      end
    end
    t
  end

  def my_any?(param = nil)
    return false if param.class == Regexp
		return false if empty?
		
    t = true
    if block_given?
			return true unless block_given?
			
      my_each do |x|        
				t = if_nil_false_return_false (yield(x))
				break if t==true
      end
    else
      if param.nil?
        my_each do |x|
					t = if_nil_false_return_false (x)
					break if t==true
        end
      else
        my_each do |x|
          t = if_is_a_class(x,param)
        end
      end
    end
    t
  end

  def my_none?(param = nil)
		return true if param.class == Regexp
		
    t = true
    if block_given?
			return true unless block_given?
			
      my_each do |x|
				t = if_false_return_true(yield(x))
				break if t==false
      end
    else
      if param.nil?
        my_each do |x|          
					t = if_true_return_false(x)
					break if t==false					
        end
      else
				my_each do |x|
					t= if_is_a_class(x,param)
        end
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
    i = first
		while i <= last
      newarray << yield(i) unless yield(i).nil?
      i += 1
		end
		newarray
	end

	def my_inject(param = nil)
    if self.class == Array
      acum = self[0]
      len = length
      newarray = self[1..len]
      newarray.my_each do |item|
        acum = yield(item, acum)
      end
      if_nil_acum_mul(param,acum)
    else
      autoarray = []
      i = first
      while i <= last
        autoarray << i
        i += 1
      end
      acum = autoarray[0]
      len = autoarray.length
      temparray = autoarray[1..len]
      temparray.my_each do |item|
        acum = yield(item, acum)
      end
      if_nil_acum_mul(param,acum)
    end
	end
	
	def if_nil_false_return_false(x)		
		if x.nil? || x == false
			return false
		else
			return true
		end
	end

	def if_false_return_true(x)
		t = false
		if x == false
			t = true
		else
			t = false			
		end
		return t
	end

	def if_true_return_false(x)
		t = false	
		if x == true
			t = false			
		else
			t = true
		end		
		return t
	end

	def if_is_a_class(x,param)
		if x.is_a? param
			return 	true
		else
			return false
		end
	end

	def if_nil_acum_mul(param, acum)
		if param.nil?
			return acum
		else
			return acum * param
		end
	end

  def Multiply_Elns(numbers)
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
