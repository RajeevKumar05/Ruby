def find_min(arr,sidx,eidx)
	puts "start = #{sidx}, end = #{eidx}"
	if sidx == eidx
		return arr[sidx]
	end
	mid = (sidx+eidx)/2
	if arr[mid] < arr[sidx]
		find_min(arr,sidx,mid)
	elsif arr[eidx] > arr[mid]
		find_min(arr,sidx,mid)
	else
		find_min(arr,mid+1,eidx)
	end
end


a = [4,5,6,7,8,9,10,11,1,2,3]
puts find_min(a,0,a.length - 1)