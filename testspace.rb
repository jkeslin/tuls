def roll_die
	die_array = []
	5.times do die1 = rand(1..6) 
	die_array << die1
	end
	puts die_array
end

def check_for_duplicate_values
	dup = die_array.select{|element| die_array.count(element) > 1 }
	puts dup.uniq
end

roll_die
check_for_duplicate_values












