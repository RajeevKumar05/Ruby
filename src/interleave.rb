@a = ['X','X','Y']
@b = ['X','X','Z']
@c = ['X','X','T','U','V','Z','Y','X','Z','X','Z']

def ii(i,j,k)
	if i == @a.length && j == @b.length
		return true
	elsif i > @a.length || j > @b.length || k >= @c.length
		return false
	elsif @a[i] == @c[k] && @b[j] == @c[k]
 		return ii(i+1,j,k+1) || ii(i,j,k+1) || ii(i,j+1,k+1)
	elsif @b[j] == @c[k]
 		return ii(i,j+1,k+1) || ii(i,j,k+1)
	elsif @a[i] == @c[k]
		return ii(i+1,j,k+1) || ii(i,j,k+1)
	else
		return ii(i,j,k+1)
	end
end

puts ii(0,0,0)



 	

