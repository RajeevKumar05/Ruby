
class Node
	attr_accessor :next, :key
	def initialize(key)
		self.key = key
		self.next = nil
	end
end

def make_list(a)
	if a == nil || a.length == 0
		return nil
	end
	head = Node.new(a.delete_at(0))
	head.next=make_list(a)
	head
end

def print_list(list)
	while(list.next) 
		print "[#{list.key}]->"
		list = list.next	
	end
	print "[#{list.key}]"
	puts
end

#WAP for a linked list so that all even number appears before odd number. Order should be preserved. O(n) time, O(1) space
def partition(head)
	if head.nil?
		return head;
	end
	even_head = nil
	even_tail = nil
	odd_tail = nil
	odd_head = nil

	while(head)
		current = head
		head = head.next
		if (current.key % 2) == 0
			if even_head.nil?
				even_head = current
				even_tail = even_head	
			else
				even_head.next=current
				even_head = even_head.next
			end
			even_head.next=odd_tail
		else
			if odd_head.nil?
				odd_head = current
				odd_tail = odd_head
			else
				odd_head.next=current
				odd_head = odd_head.next
			end
		end
	end
	even_tail.nil? ? odd_tail : even_tail
end

#WAP to re-arrange the linked list so that +ve and -ve nodes appears alternatively, O(n) time, O(1) time
def new_sign(key,sign)
	(key >= 0 ? 1 : -1)*sign
end
def alternate(head)
	if head.nil?
		return head
	end
	result_head = head
	sign = head.key >= 0 ? 1 : -1
	current = head
	previous = head
	head = head.next

	while(head)
		if new_sign(head.key,sign) < 0
			sign = -1*sign
			if(current.next == head)
				current = head
				head = head.next
				previous = current
			else
				temp = current.next
				current.next = head
				current = head
				previous.next = head.next
				head.next = temp
				head=previous.next
			end
			temp = current.next
			while(temp && temp != head && new_sign(temp.key,sign) < 0)
				current = temp
				sign = -1*sign
				temp = temp.next
			end
		else
			previous=head
			head=head.next
		end
	end
	result_head
end

list = make_list([1,2,3,4,5])
print_list(list)
print_list(partition(list))

puts
puts

list = make_list([1,2,3,-2,-4,0,-5,6,8,-3])
#list = make_list([1,2,-3,4,-5])
print_list(list)
print_list(alternate(list))


puts
puts

list = make_list([-1,-2,1,2,3,-2,-4,0,-5,6,8,-3])
#list = make_list([1,-2,3,4,-5])
print_list(list)
print_list(alternate(list))


