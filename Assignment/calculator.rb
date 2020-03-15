def add(a,b)
	a+b
end
def sub(a,b)
	a-b
end
def mul(a,b)
	a*b
end
def div(a,b)
	a/b
end
def mod(a,b)
	a%b
end

puts "Menu:\nEnter 1 to perform addition\nEnter 2 to perform subtraction\nEnter 3 to perform multiplication\n\nEnter 4 to perform division"
puts "Enter your choice: "
choice=gets.chomp.to_i
puts "Enter the operands: "
a=gets.chomp.to_i
b=gets.chomp.to_i
case choice
	when 1 then puts "The sum is #{add(a,b)}"
	when 2 then puts "The difference is #{sub(a,b)}"
	when 3 then puts "The product is #{mul(a,b)}"
	when 4 then puts "The quotient is #{div(a,b)} and the remainder is #{c.mod(a,b)}"
	else puts "Invalid choice"
end

