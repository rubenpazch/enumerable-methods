$LOAD_PATH << '.'
require './enumerable_method'

class Arraytest 
	include Enumerable
	
	def initialize (*args)
		@temparray = args.flatten
	end

	def length ()
		return @temparray.length
	end

end


arr = Arraytest.new([1,2,3,4])
puts arr.my_select {|n| n==1}
# => [1]