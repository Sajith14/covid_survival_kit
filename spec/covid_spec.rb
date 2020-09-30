# Allow the user to input multiple items and to specify quantities.
# When the order is complete:
#   Print the final order
#   Print the total bill

# Cost_price and item_names which store the price for each item and also the full name of that item


$cost_price = {"f" => 10, "s" => 20, "h" => 200, "c" => 80, "a" => 500}
$item_names = {"f"=> "Face Mask", "s"=> "Sanitiser", "h"=> "Hazmat Suit", "c"=> "Combat Boots", "a"=> "Assault Rifle", "q"=> "Quit"}
$order_hash = {}

def main()
    # puts "Here is your total bill : #{calculate_total_bill(get_order)}"
	
	quit = false

	until quit
		print_intro()
		resp = user_option()
		case resp
			when "f"
				quit = get_order()
			when "r"
				quit = confirm_quit()

		end
	end
  system "clear"
end

def print_options()
    # wrote the code to print the menu options for the customer to choose from.
	puts "*"*100
	puts " "
	puts "Covid-19 Survival Kit:"
	$item_names.map do |k,v| 
		next if v == 'Quit'
		puts "Item: #{v} 		Price: $#{$cost_price[k]}"
	end
	puts "*"*100
end 

def print_order(order_hash)
	puts " "
	puts "Your current order:"
	
	if $order_hash.empty?
		puts "You currently have nothing in your order."
	else
		$order_hash.map do |k,v| 
			puts "x #{v}	#{$item_names[k]} 	= $#{v * $cost_price[k]}"
		end
	end
	
	puts " "
	puts "	Total Bill: $#{calculate_total_bill($order_hash)}"
	
	puts "*"*42
	
	return
end

def get_order()

	system "clear"

	print_intro()
	print_order($order_hash)
	
	quit = false
	until quit

		
		order = ask_order()
		# exit out of app if user wants to quit
		return quit = true if order == "q"
		
		# if they don't want to quit, ask them how much they want to order
		amount = ask_amount()
		puts amount
		# add order to the main has
		$order_hash.key?(order) ? $order_hash[order] += amount : $order_hash[order] = amount
		
	
		system "clear"
		print_intro()
		print_order($order_hash)
		
		quit = follow_up()
	end
	
	system "clear"
	print_order($order_hash)
	puts " "
	puts "Thank you for purchasing your Covid-19 Survival Kit!"
	puts "Type [Q]uit to begin your hunting."
	print "Input: "; exit = gets.strip.downcase[0]
	exit == "q" ? (return true) : (return false)
			
end
  
def ask_amount()
	
	puts " "
	puts "How many would you like to order?"
	print "Input: "; amount = gets.strip.to_i
	puts " "

	if amount == 0 || Integer(amount) == nil
		puts "No funny business, that is an invalid entry."
		sleep 1
		ask_amount()
	end
		
	return amount
end

def ask_order()
	
	puts " "
	puts "What would you like to order? Or type 'quit' if you want to risk getting eaten by zombies."
	str = ""
	$item_names.each_value{|v| str+= "[#{v[0]}]#{v[1..v.length]}, " if v != "Quit"}
	puts str.delete_suffix(', ')
	print "Input: "; order = gets.strip.downcase[0]

	# user validate the response, if it is not a valid option, ask them again
	unless order == "f" || order == "s" || order == "h" || order == "c" || order == "a" || $item_names.key?(order)
		puts "Sorry that is not a valid order. Please try again."
		sleep 1
		system "clear"
		print_intro()
		print_order($order_hash)
		ask_order()
	end	
	
	return order
end

def user_option()
	puts " "
	puts "What would you like to do?"
	puts " "
	puts "[F]ight back"
	puts "[R]un away and cry"
	
	print "Input: "; resp = gets.strip.downcase[0]
	puts resp
	
	unless resp == "f" || resp == "r"
		puts "Invalid entry. Starting again."
		sleep 2
		main()
	end
	
	return resp
end

def follow_up()
	puts "[C]ontinue to order?"
	puts "[F]inished ordering?"

	print "Input: "; resp = gets.strip.downcase[0]
	
	if resp == 'c'
		print_intro()
		print_order($order_hash)
		return
	elsif resp == 'f'
		return true
	else
		puts "Sorry that is not a valid response."
		follow_up()
	end
end

def print_intro()
	system "clear"
	puts "
	Our Earth has been taken over by a highly contagious virus known as Covid-19 and is 
	spreading quick all over the world. This dangerous virus is known to eating the insides 
	of your organs causing you to turn into a blood sucking zombie. For your own survival 
	please purchase from our Covid-19 Survival Kit to help stop the disease and your 
	only chance of staying alive.
	"
	puts " "
	print_options()
end

def confirm_quit()
	
	system "clear"
	puts "Are you sure you want to risk getting eaten alive?"
	puts "(Y)es I want to sign my own death wish / (N)o I want to kick some ass"
	print "Input: "; ans = gets.strip.downcase[0]
	
	ans == 'y' ? (return true) : (return false)
	
end


main()