module Enumerable
	def my_each
		return to_enum(:my_each) unless block_given?
    i = 0
    while i < self.length
      yield (self[i])
      i += 1
    end    
  end

	def my_each_with_index
		return to_enum(:my_each_with_index) unless block_given?
    i = 0
    while i < self.length
      yield self[i], i
      i += 1
    end
	end	

	def my_select 
		return to_enum(:my_select) unless block_given?
		newarray=[]				
		self.my_each do |x|
			newarray << x if yield(x) == true	
		end
		return newarray
	end

	def my_all? 
		return true unless block_given?			
		t=true
		self.my_each do |x|
			if(yield(x)==nil || yield(x)==false)
				t=false
				break
			else 
				t=true
			end
		end			
		return t	
	end

	def my_any?
		return false if self.empty?
		return true  unless block_given?			
		t=true		
		self.my_each do |x|
			if(yield(x)==nil || yield(x)==false)
				t=false			
			else 
				t=true
				break
			end
		end		
		return t	
	end

	def my_none?
		return true  unless block_given?			
		t=true		
		self.my_each do |x|
			if (yield(x)==false)
				t=true			
			else 
				t=false
				break				
			end			
		end		
		return t	
	end

	def my_count(item=nil)		
		counter=0				
		if item==nil
			return self.length unless block_given?				
			self.each do |x|
				if yield(x)
					counter +=1
				end			
			end
		else 			
			self.my_each do |y|
				if (y==item)
					counter +=1 
				end			
			end
		end
		return counter
	end

	def my_map 
		return to_enum(:my_map) unless block_given?				
		newarray=[]		
		i=self.first
		while i<= self.last
			if yield(i) !=nil
				newarray << yield(i)
			end		
			i += 1
		end
		return newarray
	end
	
	def my_inject(param=nil)
		if self.class	==Array
			acum = self[0]
			len = self.length
			newarray = self[1..len]
			newarray.my_each do |item|
				acum = yield(item, acum)
			end
			if (param==nil)
				return acum
			else 
				return acum*param
			end		
		else 			
			autoarray=[]
			i=first
			while i<=last
				autoarray << i
				i+=1
			end			
			acum = autoarray[0]
			
			len = autoarray.length
			temparray = autoarray[1..len]
			temparray.my_each do |item|
				acum = yield(item, acum)
			end			
			if (param==nil)
				return acum
			else 
				return acum*param
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
		newarray=[]		
		i=self.first
		while i<= self.last
			if block.call(i) !=nil
				newarray << block.call(i)
			end		
			i += 1
		end
		return newarray
	end
	
end
