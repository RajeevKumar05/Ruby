def match(str,patt,sidx,pidx)
	if pidx >= patt.length
		return true;
	end

	if sidx >= str.length
		return false;
	end

	if patt[pidx] == '.'
		match(str,patt,sidx+1,pidx+1)
	elsif patt[pidx] == '*'
		if str[sidx] == str[sidx - 1]
			match(str,patt,sidx+1,pidx) || match(str,patt,sidx+1,pidx+1)
		else
			match(str,patt,sidx,pidx+1)
		end
	elsif str[sidx] == patt[pidx]
		match(str,patt,sidx+1,pidx+1)
	else
		false
	end
end

str = 'xxxyz'
patt = 'x*******zz'
puts match(str,patt,0,0)
			
			
			