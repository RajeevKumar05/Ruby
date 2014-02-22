require 'thread'

class Test
 def f1
  f2
 end
 def f2
  puts 'f1f2'
  a = Thread.current.backtrace
  puts a
  puts "Length = #{a.length}"
  puts "First = #{a.first}"
  puts "Last = #{a.last}"
 end
end

Test.new.f1
