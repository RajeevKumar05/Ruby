require 'active_model'
class User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :password, :tempo
  validates :email, :presence => true
  validates :password, :presence => true

  def initialize(attributes = {})
    if attributes
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end

  def persisted?
    false
  end

  def method_missing(name,*args,&block)
    puts "No such method with name #{name.to_sym}"
  end
end

u1 = User.new({:email => 'xyz', :password => 'abc', :tempo => 5})
u2 = User.new({:email => 'xyzt', :password => 'abcd'})
a = []
a << u1.email << u1.password << u1.tempo << u1.delta << u2.email << u2.password << u2.tempo << u2.xyz
puts a

b = 'xyz'

c = :tuv

h = {c => 2,b => 3,b.to_sym => 6}

puts b
puts c

puts h

