# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself].
# I spent [#] hours on this challenge.

# 2. Pseudocode
# Input: 16 digit number
# Output: true or false (based on whether it is valid)
# Steps:
# define class
# define initialize method for number that is exactly 16 digits return argument error if not 16 digits
# define method with number argument to Split number into individual digits
# define method to multiple digits by 2 in odd index positions, then separate digits
# define method to find sum of all digits
# define method to check that sum divides evenly by 10 and return true or false



# 3. Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

class CreditCard

	def initialize(card_number)
		raise ArgumentError.new("Please enter a valid 16-digit card number with no spaces.") if card_number.to_s.length != 16
		@card_number = card_number
		@number_in_digits = nil
	end

	def split_into_digits
		@number_in_digits = @card_number.to_s.split(//).map! {|string| string.to_i}
	end

	def double_alternating_digits
		@number_in_digits.map!.with_index {|digit, index| if index%2==0 then digit*2 else digit end}
	end

	def check_number_sum
		sum_of_digits = @number_in_digits.to_s.split(//).map! {|string| string.to_i}.inject(:+)
		if sum_of_digits%10==0
			return true
		else
			return false
		end
	end

	def check_card
		split_into_digits
		double_alternating_digits
		check_number_sum
	end
end

card_1 = CreditCard.new(4408041234567901)
card_2 = CreditCard.new(1111111111111111)
# card_3 = CreditCard.new(123456789)

p card_1.check_card
p card_2.check_card
# p card_3.check_card


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection
