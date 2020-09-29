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