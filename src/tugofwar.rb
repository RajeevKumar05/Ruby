#Program to divide a set of integers of size n to two subsets of size n/2 such that difference of sum is minimum
@total = 0
@sol = []
@prediff = 999

def sum(s)
	sm = 0
	for i in 1..s.length
		sm += s[i-1]
	end
	sm
end

def diff(value)
	t2 = @total - value
	t2 > value ? t2 - value : value - t2
end

def half(alength,slength)
	if(alength%2 == 0)
		slength == alength/2
	else
		slength == alength/2 || slength-1 == alength/2
	end
end


def tugOfWar(s,idx,stk)
	if half(s.length,stk.length)
		if diff(sum(stk)) < @prediff
			@prediff = diff(sum(stk))
			@sol = stk.clone
		end
	elsif idx == s.length
		return
	else
		stk << s[idx]
		tugOfWar(s,idx+1,stk)
		stk.pop
		tugOfWar(s,idx+1,stk)
	end
end

a = [1,2,3,4,5,6,7,8]
#a = [1,2,3]

@total = sum(a)

tugOfWar(a,0,[])

puts "Team A = #{@sol.join(',')}, Sum = #{sum(@sol)}"

#If original array has repeating element - operation removes all of them
#Eg. [1,2,3,4,4,4,5] - [1,4,5] = [2,3], Which is unacceptable for us
#Hence come up with a subtraction scheme for array, may be custom method
#Or, modify tugOfWar method itself to accept two stack belongs one to each team.
puts "Team B = #{(a-@sol).join(',')}"
puts "Tatal = #{@total}"
puts "Diff = #{@prediff}"