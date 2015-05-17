def check_for_duplicate_values
	dice_roll_array = []
	5.times do die1 = rand(1..6) 
	dice_roll_array << die1
	end
	dup = dice_roll_array.select{|element| dice_roll_array.count(element) == 5 }
	if dup.count == 5 then puts "Yahtzee!  Your lucky number was #{dup.uniq}" 
	else puts "Sorry!  You rolled #{dice_roll_array}. Better luck next time."
	end
end

1000.times do check_for_duplicate_values end

