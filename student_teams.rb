students = [] 
puts "Enter all the students that showed up today."
puts "Type done when all of the students are entered."

input = gets.chomp #can't initiate in the string below so initiate here

until input == 'done'
	students.push(input)
	input = gets.chomp
end

students.shuffle!

#working with an array we need a count, working with indexes
count = 0

until count == students.length

	
	if students.length%2 == 1
	if students.length == 1
		puts "#{students[count]}"	#need it in this so that it does not create an infinite loop
		count += 1
	elsif count < students.length - 3
		puts "#{students[count]} & #{students[count+1]}"
		count += 2
	
	else
	puts "#{students[count]} & #{students[count+1]} & #{students[count+2]}"
	
	count += 3 #looping through an increasing amount changed 1 to 2 so that people were not repeated, 
				#change to 3 when odd number of students
	end	

	else
		puts "#{students[count]} & #{students[count+1]}"
		count +=2
	end		
end 