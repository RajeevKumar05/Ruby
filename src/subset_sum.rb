require './multi_array.rb'

def print_list(list)
	puts list.join(',')
end

#DP to check whether a subset is possible to produce a given sum
def is_subset_sum(arr,sum)
	sol = MultiArray::build(sum + 1, arr.length + 1)

	sol[0][0] = 1
	for i in 1..(arr.length)
		sol[0][i] = 1
	end

	for i in 1..sum
		for j in 1..(arr.length)
			sol[i][j] = sol[i][j - 1]
			if i - arr[j - 1] >= 0 && sol[i - arr[j - 1]][j - 1] == 1
				sol[i][j] = sol[i - arr[j - 1]][j - 1]
			end
		end
	end

	sol
end


#DP to check whether a sum is possible by few or all items, an item can be chosen multiple time
def is_sum_possible(arr,sum)
	sol = MultiArray::build(sum + 1, arr.length + 1)

	sol[0][0] = 1
	for i in 1..(arr.length)
		sol[0][i] = 1
	end

	for i in 1..sum
		for j in 1..(arr.length)
			sol[i][j] = sol[i][j - 1]
			if i - arr[j - 1] >= 0 && sol[i - arr[j - 1]][j] == 1
				sol[i][j] = sol[i - arr[j - 1]][j]
			end
		end
	end

	sol
end






arr = [2,4,5]
sum = 11

sol = is_subset_sum(arr,sum)

for i in 1..sum
	for j in 1..(arr.length)
		print "#{sol[i][j]}  "
	end
	puts
end


puts '---------------------------------------'


arr = [3,4,5]
sum = 11

sol = is_sum_possible(arr,sum)

for i in 1..sum
	for j in 1..(arr.length)
		print "#{sol[i][j]}  "
	end
	puts
end

