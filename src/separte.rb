def swap(list,idx1,idx2)
	t = list[idx1]
	list[idx1] = list[idx2]
	list[idx2] = t
	list
end

def separate(list)
	idx = list.length
	idx -= 1
	while(idx > 0) do
		iidx = idx
		if list[idx] < 0
			pidx = idx - 1
			while(pidx >= 0) do
				if list[pidx] > 0
					list = swap(list,idx,pidx)
					if idx < iidx
						iidx += 1
					end
					break
				else
					idx = pidx
				end
				pidx -= 1
			end
		end
		idx = iidx - 1
	end
	list
end

list = [1,2,-3,4,6,-9,10]
list = [-1 ,1 ,3 ,-2 ,2]
puts separate(list).join(',')