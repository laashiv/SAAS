a=[]
while true
	puts "\t\tOperations on numeric array\nEnter 1 to add a value\nEnter 2 to find minimum\nEnter 3 to find maximum\nEnter 4 to find sum\nEnter 5 to find average\nEnter 6 to search for a value\nEnter 7 to display all values\nEnter 8 to delete value by index\nEnter 9 to delete a value\nEnter 10 to exit"
	n=gets.chomp.to_i
	case n
		when 1
			puts"Enter a value to be added: "
			k=gets.chomp.to_i
			a.push(k)
		when 2
			puts"The minimum value is #{a.min()}"
		when 3
			puts"The maximum value is #{a.max()}"
		when 4
			puts"The sum is #{a.sum()}"
		when 5
			puts"The average is #{(a.sum())/(a.length())}"
		when 6
			puts"Enter a value to be searched for: "
			k=gets.chomp.to_i
			if a.index(k)
				puts"The value is at the index #{a.index(i)}"
			else
				puts"There is no such value in the array"
			end
		when 7
			puts"Array elements:"
			puts a
		when 8
			puts"Enter a index to be deleted"
			k=gets.chomp.to_i
			if k>(a.size()-1)
				puts"Invalid index"
			else
				a.delete_at(k)
				puts"Index value Deleted"
			end
		when 9
			puts"Enter a value to be deleted"
			k=gets.chomp.to_i
			if a.include?(k)
				a.delete(k)
				puts"Value deleted"
			else
				puts"There is no such value in the array"
			end
		when 10
			break
		end
end
