def combinite(source,sidx,bucket,bidx,size)
	if(bidx == size)
		puts bucket.join(',')
	elsif sidx == source.length
		return
	else
		bucket[bidx] = source[sidx]
		combinite(source,sidx+1,bucket,bidx+1,size)
		combinite(source,sidx+1,bucket,bidx,size)
	end
end

combinite(['A','B','C','D'],0,[],0,2)