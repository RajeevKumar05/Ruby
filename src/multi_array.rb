module MultiArray
	def self.build(*dim)
		if !dim || dim.length <= 0
			return []
		end

		temp = []
		d = dim.length - 1
		for i in 0..(dim[d] - 1)
			temp << 0
		end

		d -= 1

		multi_array = temp
		temp = []

		while d >= 0 do
			for i in 0..(dim[d] - 1) 
				temp << multi_array.clone
			end
			multi_array = temp
			temp = []
			d -= 1
		end

		multi_array
	end
end