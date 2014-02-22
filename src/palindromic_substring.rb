require './multi_array.rb'

def palindromic_string(str, size)
	if !str || str.length < size
		return true
	end

	l = str.length
	matrix = MultiArray::build(l, l)
	puts matrix.inspect
	for i in 0..(l - 1)
		matrix[i][i] = 1
		for j in 0..(i - 1)
			if str[i] == str[j]
				if j == i - 1
					matrix[j][i] = 1
				else
					matrix[j][i] = matrix[j + 1][i - 1]
				end
			end
		end
	end
	puts matrix.inspect
end


palindromic_string('abab',1)
puts "======================================================="

#puts MultiArray::build(1).inspect
# puts MultiArray::build.inspect
# puts MultiArray::build(1,1).inspect
# puts MultiArray::build(2,3).inspect
# a = MultiArray::build(2,2,2)

# puts a.inspect

# puts a[0].inspect

# puts a[0][1].inspect