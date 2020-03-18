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

				if yield(x).nil? || yield(x) == false
          t = false
          break

				else
          t = true
				end

      end
    else
      if param.nil?
        my_each do |x|
					t = my_condition (x)
					break if t==false
        end
      else
        my_each do |x|
          if x.is_a? param
            t = true
          else
            t = false
            break
          end
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
        if yield(x).nil? || yield(x) == false
          t = false
        else
          t = true
          break
        end
      end
    else
      if param.nil?
        my_each do |x|
          if x.nil? || x == false
            t = true
            break
          else
            t = false
          end
        end
      else
        my_each do |x|
          t = if x.is_a? param
                true
              else
                false
              end
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
        if yield(x) == false
          t = true
        else
          t = false
          break
        end
      end
    else
      if param.nil?
        my_each do |x|
          if x == true
            t = false
            break
          else
            t = true
          end
        end
      else
        my_each do |x|
          t = if x.is_a? param
                true
              else
                false
              end
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
		return newarray
	end

	def my_condition(x)		

		if x.nil? || x == false
			return false
		else

			return true
		end

	end

	def my_inject(param = nil)
    if self.class == Array
      acum = self[0]
      len = length
      newarray = self[1..len]
      newarray.my_each do |item|
        acum = yield(item, acum)
      end
      if param.nil?
        acum
      else
        acum * param
      end
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
      if param.nil?
        acum
      else
        acum * param
      end
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
