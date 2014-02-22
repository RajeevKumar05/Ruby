require 'thread'
class AsyncTest
	@@queue = Queue.new
	def initialize()
		puts 'Initialized !!'
	end

	def request(a)
		puts 'Task submitted'
		@@queue << a
	end

	def start
		while(true)
			i = @@queue.pop
			if i
				i.response
				sleep 5
			else
				break
			end
		end
	end
end


class Job
	def initialize(j)
		@id = j
	end
	def response
		puts "Job #{@id} completed"
	end
end

at = AsyncTest.new
at.request(Job.new(1))
at.request(Job.new(2))
at.request(Job.new(3))
at.request(Job.new(4))
at.request(Job.new(5))

puts 'All job submitted !!'
p 'Starting worker......'
at.start


