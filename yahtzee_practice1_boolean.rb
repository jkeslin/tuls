
def roll_die
	die = rand(1..6)
	
end

def roll_die2
	die = rand(1..6)
end

def roll_die3
	die = rand(1..6)
end

def roll_die4
	die = rand(1..6)
end

def roll_die5
	die = rand(1..6)
end

def check_for_dice_match
	if roll_die == roll_die2 == roll_die3 == roll_die4 == roll_die5 then puts "match"
	else puts "Try again"
	end
end

check_for_dice_match	








