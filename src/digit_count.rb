#Program to print digit counts in 0-n

def digit_count(num,seed,no_of_digit)
	if num >= seed*10 - 1
		sum(count(no_of_digit),digit_count(num,seed*10,no_of_digit+1))
	elsif (seed - 1)*10 - 1 == num 
		[0,0,0,0,0,0,0,0,0,0]
	else
		particular_count(num,no_of_digit)
	end
end

def particular_count(number,length)
	result = [0,0,0,0,0,0,0,0,0,0]
	product = 1
	digits  = []
	while(number > 0) do
		d = number % 10
		product *= number > 10 ? d + 1 : d
		digits << d
		number = number/10
	end
	
	d = digits.last
	t_p = product/d
	while(d > 0) do
		result[d] += t_p
		d -= 1 
	end
	#print(digits)
	l = digits.length - 1
	digits.delete_at(l)
	#print(digits)
	digits.each do 
		|digit|
		t_p = product/(digit + 1)
		while(digit >= 0) do
			result[digit] += t_p
			digit -= 1 	
		end
	end
	result
end

def sum(arr1,arr2)
	arr1.each_index do
		|i|
		arr1[i] = arr1[i] + arr2[i]
	end
	arr1
end


def pow(base,power)
	result = 1
	power.times do
		result *= base
	end
	result
end


def count(n)
	if(n==1)
		[1,1,1,1,1,1,1,1,1,1]
	elsif n==2
		[9,19,19,19,19,19,19,19,19,19]
	else
		result = Array.new
		result[0] = (n-1)*pow(10,n-2)*9
		idx = 1
		9.times{ 
			result[idx] = (n-1)*pow(10,n-2)*9 + pow(10,n-1)
			idx += 1
		}
		result
	end	
end

def print(arr)
	arr.each_index do
		|i|
		puts "#{i} --> #{arr[i]}"
	end
end

print(digit_count(123,1,1))
#print(particular_count(234,3))




