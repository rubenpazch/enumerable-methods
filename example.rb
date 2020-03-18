$LOAD_PATH << '.'
require './enumerable_method'
require './enumerable_method_part2'
require 'test/unit'


arr=[1,2,3,4,5,6,7,8]
t=true
x=0
while x<arr.length
	if arr[x].nil? || arr[x] == false
		t = false
		break
	else
		t = true
	end
	x+=1
end

puts t