#This code re-arrange elements of an array such that +ve and -ve comes alternatively

def alternate(a)
	if a.nil? || a.length < 2
		return a
	end
	sign = a[0] < 0 ? -1 : 1
	i=1
	j=1
	while j < a.length
		if a[j]*sign < 0
			t = a[i]
			a[i] = a[j]
			a[j] = t
			i += 1
			sign = -1*sign
			if j > i
				if a[i+1]*sign < 0
					i += 1
					sign = -1*sign
				end
			end
		end
		j += 1
	end
	a
end

a = [-1,2,3,22,4,-3,-4,5]


puts alternate(a).join(',') 