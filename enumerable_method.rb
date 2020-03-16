module Enumerable
	def my_each(array)
		return to_enum(:my_each) unless block_given?
    i = 0
    while i < array.length
      yield (array[i])
      i += 1
    end
    array
  end

	def my_each_with_index(array)
		return to_enum(:my_each_with_index) unless block_given?
    i = 0
    while i < array.length
      yield array[i], i
      i += 1
    end
	end
	

	def my_select (array,&block)
		return to_enum(:my_select) unless block_given?
		newarray=[]		
		i=0
		while i< array.length
			if block.call(array[i]) == true 
				newarray << array[i] 	
			end		
			i += 1
		end
		return newarray
	end

	def my_all? (array)	
		return false unless block_given?	
		i=0
		t=false
		while i< array.length
			t= yield array[i]
			i += 1
		end			
		return t	
	end

	def my_any? (array)		
		i=0
		t=false
		while i< array.length
			t= true if yield array[i] !=nil
			i += 1
		end			
		return t	
	end

end
