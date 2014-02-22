def fixed_point(arr,first,last)
	if last < first
		return -1
	end

	mid = (first + last)/2
	if arr[mid] < mid
		fixed_point(arr,mid+1,last)
	elsif arr[mid] > mid
		left = fixed_point(arr,first,mid-1)

		#Handle situation where array is not strictly increasing, like to handle cases for [1,1]
		#If we dont consider right part result would be incorrect
		right = fixed_point(arr,mid+1,last)
		left > 0 ? left : right
	else
		return mid
	end
end

puts fixed_point([-1,0,1,3,5,6],0,5)
puts fixed_point([-1],0,0)
puts fixed_point([1,1],0,1)