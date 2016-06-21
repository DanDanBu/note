class Person 
	def initialize(age)
		@age = age
	end
	def age_new(new_age)
		@age = new_age
	end
	def age()
		return(@age)
	end
end

p = Person.new(28)
p.age_new(23)
puts p.age()

puts Array.ancestors()


#baseball player

class BaseBallPlayer
	def initialize(hits, walks, at_bats)
		@hits = hits
		@walks = walks
		@at_bats = at_bats
	end
	
	def batting_average()
		return (@hits.to_f) / (@at_bats.to_f) 
	end
	
	def on_base_percentage()
		return (@hits.to_f + @walks.to_f) / (@at_bats.to_f)
	end
end

baseball = BaseBallPlayer.new(308, 262, 450)
puts baseball.batting_average()
puts baseball.on_base_percentage()


#another person class

class Person
	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name = last_name
	end
	
	def first_name()
		return @first_name
	end
	
	def last_name()
		return @last_name
	end
	
	def full_name()
		return "#{@first_name} #{@last_name}"
	end
end

dan = Person.new("dan", "huang")
puts dan.first_name()
puts dan.last_name()
puts dan.full_name()
