#practice for object-oriented of ruby

puts "upper".upcase
puts -5.abs
puts 99.class
5.times do
	print "Ruby "
end

puts
#practice ruby conversions

var1 = 2
var2 = '5'

puts var1.to_s + var2
puts var1 + var2.to_i

puts 9.to_f/2
puts 9/2


#In ruby, a word start with upper case letter is a Constant

#Symbol is an unchanged variable , such as :this_is_a_symbol

puts "foobar".object_id
puts "foobar".object_id
puts :foobar.object_id
puts :foobar.object_id
#this mean that if you are not a symbol, even values are same, two string are still different object.


#practice ruby array

a = [1, "cat", 3.14]

puts a[0]
puts a.size
a[2] = nil
puts a.inspect #inspect method will change object to visible string.
a.push("123")
puts a.inspect
a.pop
puts a.inspect
a[99] #return nothing


colors = ["red", "blue"]

colors.push("black")
colors << "white"
puts colors.join(", ")

colors.pop
puts colors.last

languages = ['Ruby', 'Java', 'Perl']

languages.each do |lang|
	puts 'I love ' + "#{lang}" + '!'
end


#here is a hash practice
config = { :foo => 123, :bar => 456, :white => 789}
puts config[:foo].object_id
puts config[:foo].object_id
puts config[:bar]
puts config[:white].object_id
puts config[:white].object_id

config.each do |key, value|
	puts "#{key} is #{value}"
end

puts
#flow control

puts (2 > 1) && (2 > 3)
puts (2 > 1) || (2 > 3)

total = 30000

if total > 100000
   puts "large account"
elsif total > 28000
   puts "medium account"
else 
   puts "small account"
end
# while you only have one if then you can put it to the end of sentence.

x = 3
if x > 3
	y = "foo"
else 
	y = "bar"
end

x = 3
y = (x > 3) ? "foo" : "bar"

#control structure case
name = "Dan"
case name
	when "John"
		puts "Hello John~"
	when "Ryan"
		puts "Yo Ryan~"
	else 
		puts "Hi #{name}!"
end

#loop practice

#while
i=0
while(i<10)
	i += 1
	next if i % 2 == 0
end
puts i

#until
i=0
i += 1 until i > 10
puts i

#loop
i=0
loop do
	i+=1
	break if i > 10
end
puts i

#about regular expression : use =~ to express your RE

phone = "123-456-7890"
if phone =~ /(\d{3})-(\d{3})-(\d{4})/
	ext = $1
	city = $2
	num = $3
end
puts $1, $2, $3

#about method definition practice

def say_hello(name)
	result = "Hi, " + name
	return result
end

puts say_hello('Dan')
puts say_hello 'Dan'


def say_hello(name = "nobody")
	result = "Hi, " + name
	return result
end

puts say_hello

#about question mark and exclamation mark

array=[2, 1, 3]

puts array.empty?
print array.sort
puts
puts array.inspect

print array.sort!
puts
puts array.inspect

color_string = String.new  # == color_string = ""
color_array = Array.new    # == color_array = []
color_hash = Hash.new      # == color_hash = {}

t = Time.new(1993)		   #build-in time class
puts t

class Person
	def initialize(name)
		@name = name       #object variable
	end
	
	def say(word)
		puts "#{word}, #{@name}"
	end
	
	@@name = "ihower"      #class variable
	
	def self.say
		puts @@name
	end
end

p1 = Person.new("ihower")
p2 = Person.new("ihover")

p1.say("Hello")
p2.say("Hello")

Person.say


#data packaging

class Person
	def initialize(name)
		@name = name
	end
	
	def name
		@name
	end
	
	def name=(name)
		@name = name
	end
end

p = Person.new('ihower')
puts p.name
puts p.name = "peny"
puts p.name
puts p

class Demo
	puts "foobar"
end

#Meta-programming : In ruby, we always access objective variables. So ruby provide attr_accessor, attr_writer,
#attr_reader to straightly define these method.

class Person
	attr_accessor :name
	
	def initialize(name)
		@name = name
	end
end

p=Person.new("Dan")
puts p.name
p.name = "Peny"
puts p.name
puts p


#Method packaging :

class MyClass

	def public_method
	end
	
	private
	
	def private_method_1
	end
	
	def private_method_2
	end
	
	protected
	
	def protected_method
	end

end

#In Ruby, there are some difference between other languages. Private and Protected methods are able to be called 
#in the entire inheritance. private only for inside object, protected can call by self and subclass or another
#same object class.



#inheritance


class Pet
	attr_accessor :name, :age
	
	def say(word)
		puts "Say: #{word}"
	end
end

class Cat < Pet
	def say(word)
		puts "Meow~"
		super
	end
end

class Dog < Pet
	def say(word, person)
		puts "Bark at #{person}!"
		super(word)
	end
end

Cat.new.say("Hi")
Dog.new.say("Hi", "ihower")
#if in dog class you don't have overwrite super parameter, then may return ("Hi", "ihower") back to super
#and cause an error.
#(override change actions and decisions, overwrite change information)


#Module : it's similar to class, you can define some method in it, but you can't new it.


#First purpose: as a Namespace

module MyUtil

	def self.foobar
		puts "foobar"
	end

end
MyUtil.foobar

#Second purpose: Mixins, two .rb files use require to quote.
#we use foobar.rb and debug.rb to see this purpose.


#Ruby use module to solve multi-inheritance problem.If there are different class but have same method, 
#we can put it in module, then include it. 
