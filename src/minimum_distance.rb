#Program to compute minimum distance between given two integer in an array

$INFINITY = 9999

def minimumdistance(a,n1,n2)
	if a.nil? || a.length == 0
		return -1
	elsif a.length == 1
		if n1 == n2 && a[0] == n1
			return 0
		else
			return $INFINITY
		end
	else
		return minimumDistanceUtil(a,n1,n2)
	end
end

def minimumDistanceUtil(a,n1,n2)
	d = $INFINITY
	pre = 1
	for i in 1..a.length do
		if n1 == a[i-1] || n2 == a[i-1]
			if(n1 == n2)
				return 0
			elsif n1 == a[i-1] && n2 == a[pre-1]
				d = d > i-pre ? i-pre : d
			elsif n2 == a[i-1] && n1 == a[pre-1]
				d = d > i-pre ? i-pre : d
			end
			pre = i
		end
	end
	d
end



a = [1,4,3,2,3,3,4,8,4,4]
n1 = 2
n2 = 4

puts minimumdistance(a,n1,n2)
