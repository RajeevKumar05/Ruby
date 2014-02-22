#@a is private variable
#b is public variable
class Test
	attr_accessor :b
	@a
	def initialize(a)
		@a=a
	end
	def test
		puts "a = #{@a}"
		puts "b = #{b}"
	end
end

t1 = Test.new(5)
t2 = Test.new(10)
t1.test
t2.test
t1.test
t2.test
t2.b=9
t1.b = 8
t1.test
t2.test
puts t1.b
puts t2.b