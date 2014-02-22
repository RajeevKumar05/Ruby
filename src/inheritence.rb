class BaseClass
	def basefoo
		p 'in basefoo'
		pfoo1
	end
end

class Class1 < BaseClass
	def test
		basefoo
	end

	private
		def pfoo1
			puts 'in private foo'
		end
end


Class1.new.test

c = Class1.new
p c.class
