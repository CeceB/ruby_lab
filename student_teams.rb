students = ["Megan","Eamon","Keith","Ryan","Brian","Cecelia","Brant","Postal"]

students.shuffle!

#working with an array we need a count, working with indexes
count = 0

until count == students.length
#while count is < students.length
	
	puts "#{students[count]}&#{students[count+1]}"

	count += 2 #looping through an increasing amount changed 1 to 2 so that people were not repeated
end 