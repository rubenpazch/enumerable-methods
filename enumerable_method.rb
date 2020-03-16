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

	def my_select (array)
		return to_enum(:my_select) unless block_given?
		newarray=[]		
		i=0
		while i< array.length
			if yield(array[i]) == true 
				newarray << array[i] 	
			end		
			i += 1
		end
		return newarray
	end

	def my_all? (array)	
		return true unless block_given?	
		i=0
		t=true
		while i< array.length			
			if(yield(array[i])==nil)
				t=false
				break
			elsif(yield(array[i])==false)
				t=false
				break
			else 
				t=true
			end

			i += 1
		end			
		return t	
	end

	def my_any? (array)	
		return false if array.empty?
		return true  unless block_given?	
		i=0
		t=true
		
		while i< array.length			
			if(yield(array[i])==nil)
				t=false				
			elsif(yield(array[i])==false)
				t=false				
			else 
				t=true
				break
			end

			i += 1
		end
		
		return t	
	end

	def my_none? (array)			
		return true  unless block_given?	
		i=0
		t=true		
		while i< array.length			
			if (yield(array[i])==false)
				t=true			
			else 
				t=false
				break				
			end
			i += 1
		end
		
		return t	
	end

	def my_count(array, item)
		return array.length  unless block_given?	
		counter=0
		
		if item==nil
			i = 0
			while i < array.length
				if yield(array[i])
					counter +=1
				end
				i += 1
			end
		else 
			j = 0
			while j < array.length
				if (array[j]==item)
					counter +=1 
				end
				j += 1
			end
		end
		return counter
	end

end
