def swap(source,idx1,idx2)
	temp  = source[idx1]
	source[idx1] = source[idx2]
	source[idx2] = temp
end

def permute(source,bucket,sidx,bidx,size,length)
	if(size == bidx)
		puts bucket.join(',')
	else
		for i in sidx..length-1
			bucket[bidx] = source[i]
			swap(source,sidx,i)
			permute(source,bucket,sidx+1,bidx+1,size,length)
			swap(source,sidx,i)
		end
	end
end


permute(['A','B','C'],[],0,0,3,3)