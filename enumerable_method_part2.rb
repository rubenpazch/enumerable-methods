module Enumerable
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