class Account
	def initialize(acct_num,name,pin,balance)
		@acct_num = acct_num 			#defining global variable
		@name = name
		@pin = pin
		@balance = balance
	end
	def acct_num
		@acct_num
	end
	def name
		@name
	end
	def pin
		@pin
	end
	def balance
		@balance
	end
	def withdrawal(input)
		@balance -= input
	end
	def deposit(input)
		@balance += input
	end
end

def main
	puts "Welcome to Tech Talent Bank"

	account_count = 0       #so when accounts are opened their account numbers increase by one

	account_storage = []	#where we are keeping accounts (don't need names, etc. because 
							#the numbers are already connected to the other info) - in this empty array
	main_menu(account_count,account_storage)
end

def main_menu(account_count,account_storage)
	puts "Choose from the following options."
	puts "__________________________________"
	puts "1. Create an account."
	puts "2. View existing account."
	puts "3. End session."

	choice=gets.chomp.to_i

	if choice == 1
		puts 'clear'
		create_account(account_count,account_storage)	#call a method
	elsif choice == 2
		puts 'clear'
		view_account(account_count, account_storage)
	elsif choice == 3
		puts 'clear'
		end_session
	else
		puts 'clear'
		puts "Not a valid selection."
		main_menu(account_count, account_storage)    #takes them back to the main menu, takes account information with them
	end
end

def create_account(account_count, account_storage)
	puts "Thanks for creating an account with us."
	print "What is your name?"
	customer_name = gets.chomp
	print "Create a four digit pin number."
	customer_pin = gets.chomp.to_i
	print "Please provide and initial deposit: $"
	initial_deposit = gets.chomp.to_f

	account_count = 1

	new_customer = Account.new(account_count+1,customer_name,customer_pin,initial_deposit)

	account_storage.push(new_customer)  #creates a local table

	puts 'clear'
	puts "Account Created"
	puts "Name: #{new_customer.name}"
	puts "Acct no. #{new_customer.acct_num}"
	puts "Your PIN: #{new_customer.pin}"
	puts "Available balance: $#{new_customer.balance}"
	puts ""
	puts "Back to main menu? [y/n]"
	answer = gets.chomp.downcase
		if answer == "y"
			main_menu(account_count, account_storage)
		else
			end_session
		end
end

def return_to_main_menu(account_count, account_storage)
	puts "Back to main menu? [y/n]"
	answer = gets.chomp.downcase
	if answer == "y"
		main_menu(account_count,account_storage)
	elsif answer = "n"
		end_session
	else
		puts "please type 'y' for Yes, 'N' for No."
		return_to_main_menu(account_count,account_storage)
	end
end	

def view_account(account_count,account_storage)			#references line 52
	puts "To view existing account, please provide the following"
	print "Name on the account:"
	name = gets.chomp
	print "Account number"
	acct_num = gets.chomp.to_i      			#go through account storage and look for matching name and number

	account_storage.each do |account|
		if name == account.name && acct_num == account.acct_num
			puts "Please enter your PIN"
			pin = gets.chomp.to_i 

			if pin == account.pin 				#account.pin is a reference to the first class "account"
				puts "Access Granted"
				puts "Account Balance: $#{account.balance}"
				view_account_menu(account,account_count,account_storage)
			else
				puts "Access Denied"
				sleep(10)
				main_menu(account_count,account_storage)

			end
		else
			puts "no records found matching that information"
			view_account(account_count, account_storage)
		end
	end
end

def view_account_menu(account,account_count,account_storage)
	puts "Account Menu"
	puts "____________"
	puts "1. Make a deposit"
	puts "2. Make a withdrawal"
	puts "3. Return to main menu"
	puts "4. End session"

	choice = gets.chomp.to_i

	if choice == 1
		make_deposit(account,account_count,account_storage)
	elsif choice == 2
		make_withdrawal(account,account_count,account_storage)
	elsif choice == 3
		main_menu(account_count,account_storage)
	elsif choice == 4
		end_session
	else
		puts"Not a valid selection"
		puts 'clear'
		view_account_menu(account,account_count,account_storage)
	end	
		
end

def make_deposit(account,account_count,account_storage)
	puts "How much would you like to deposit today?"
	print "$"
	todays_deposit = gets.chomp.to_f

	account.deposit(todays_deposit)   #.deposit is a method associated with this class, todays deposit is a variable take from the user

	puts "Your new balance is $#{account.balance}"
	return_to_main_menu(account_count,account_storage)		#calls return to main menu method
end

def make_withdrawal(account,account_count,account_storage)
	puts "How much would you like to withdrawal today?"
	print "$"
	todays_withdrawal = gets.chomp.to_f

	account.withdrawal(todays_withdrawal)   #.deposit is a method associated with this class, todays deposit is a variable take from the user

	puts "Your new balance is $#{account.balance}"
	return_to_main_menu(account_count,account_storage)			#calls return to main menu method
end

def end_session
	puts "Thanks for banking with us."
end
main #calls the main method above