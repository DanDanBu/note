module MathHelper
	def multiply_by_two(num)
		return num * 2
	end
	
	def exponent(num1, num2)
		return num1 ** num2
	end
end

class Homework
	include MathHelper
end

class Calculator
	include MathHelper
	def square_root(number)
		return exponent(number, 0.5)
	end
end

h = Homework.new()
h.multiply_by_two(3)

c = Calculator.new
puts c.square_root(16)
