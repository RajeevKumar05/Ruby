INFINITY = 999
def minimum(x,y)
	x > y ? y : x
end

def coin_sum(array,sum,idx)
	if (sum > 0 && idx < 0) || sum < 0
		return INFINITY
	end
	if sum == 0
		return 0
	end
	return minimum(coin_sum(array,sum,idx - 1),1 + coin_sum(array,sum - array[idx], idx - 1))
end


def solution_matrix(array,sum)
	sol = []
	row = []
	for i in 0..(array.length)
		row << 0
	end
	sol << row
	for i in 1..sum
		row = []
		for i in 0..(array.length)
			row << INFINITY
		end 
		sol << row
	end

	for i in 1..sum
		for j in 1..(array.length)
			sol[i][j] = sol[i][j - 1]
			if (i - array[j - 1]) >= 0
				sol[i][j] = minimum(sol[i][j - 1], 1 + sol[i - array[j - 1]][j - 1])	
			end
		end
	end
	sol[sum][array.length]
end

a = [2,1,1,1,1,12,3,4,5,2,5,6,8,3]

puts coin_sum(a,15, a.length - 1)
puts solution_matrix(a,15)