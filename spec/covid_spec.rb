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

        