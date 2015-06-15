def check_for_duplicate_values
	dice_roll_array = []
	5.times do 
	  dice_roll_array << rand(1..6)
	end
	dup = dice_roll_array.select{|element| dice_roll_array.count(element) == 5 }
	puts "dup: #{dup}"
  if dup.count == 5 then puts "Yahtzee!  Your lucky number was #{dup.uniq}" 
	else puts "Sorry!  You rolled #{dice_roll_array}. Better luck next time."
	end
end

# 100.times { check_for_duplicate_values } 

#make empty array 
#select random number from 1 to 6
#happen 5 times
#store in array
#check to see if values repeats

def build_hash
  dice_roll_hash = {}
end

def roll_die
  rand(1..6)
end

def store_rolls(current_roll)
  #roll die
  #output of roll die to create key in hash
  #value will be 1
  hash = {}
  5.times do
    current_roll = roll_die
    if hash[current_roll]
      #add 1 to the value at that roll number
      value = hash[current_roll]
      new_value = value + 1
      hash[current_roll] = new_value
    else 
      #didn't find that roll number
      hash[roll_die] = 1
    end
  end
  puts hash
end

store_rolls



def play_yahtzee
  roll = roll_die
  store_rolls(roll)
end


#---------#
play_yahtzee