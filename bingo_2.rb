# U2.W6: Create a Bingo Scorer (SOLO CHALLENGE)

# I spent [2] hours on this challenge.

# Pseudocode
# create bingoscorer class
# define initialize method with board as argument
# create instance variable for board
# define method for checking horizontal bingo
# => check each nested array element for a count of 5 "x" strings
# => if count equals five, print "BINGO" to the console
# define method for checking vertical bingo
# => transpose bingo board
# => (use same definition as horiziontal with transposed board)
# => check each nested array element for a count of 5 "x" strings
# => if count equals five, print "BINGO" to the console
# define method for checking downward diagonal bingo
# => check for "x" in each nested array by checking for x's where first and second index are the same, such as [1][1]

# define method for checking upward diagonal bingo
# => check for "x" in each nested array where first and second index have a sum of 4 






# sample boards

# horizontal = [[47, 44, 71, 8, 88],
#               ['x', 'x', 'x', 'x', 'x'],
#               [83, 85, 97, 89, 57],
#               [25, 31, 96, 68, 51],
#               [75, 70, 54, 80, 83]]

# vertical = [[47, 44, 71, 'x', 88],
#             [22, 69, 75, 'x', 73],
#             [83, 85, 97, 'x', 57],
#             [25, 31, 96, 'x', 51],
#             [75, 70, 54, 'x', 83]]


# right_to_left = [['x', 44, 71, 8, 88],
#                  [22, 'x', 75, 65, 73],
#                  [83, 85, 'x', 89, 57],
#                  [25, 31, 96, 'x', 51],
#                  [75, 70, 54, 80, 'x']]


# left_to_right = [[47, 44, 71, 8, 'x'],
#                   [22, 69, 75, 'x', 73],
#                   [83, 85, 'x', 89, 57],
#                   [25, 'x', 96, 68, 51],
#                   ['x', 70, 54, 80, 83]]




# Initial Solution
# class BingoScorer

# 	def initialize(board)
# 		@board = board
# 		@got_bingo = false
# 	end

# 	def check_for_horitzonal_bingo
# 		@board.each do |bingo_row|
# 		@got_bingo = true if bingo_row.count('x') == 5
# 		end
# 	end

# 	def check_for_vertical_bingo
# 		transposed_board = @board.transpose
# 		transposed_board.each do |bingo_column|
# 		@got_bingo = true if bingo_column.count('x') == 5
# 		end
# 	end

# 	def check_for_downward_diagonal_bingo
# 		diagonal_array = []

# 		@board.each_with_index do |nested, index1|
#   			nested.each_with_index do |space, index2|
#     			if index1 == index2 && space == 'x'
#       				diagonal_array << space
# 			    end
# 			end  
# 		end
# 		@got_bingo = true if diagonal_array.count('x') == 5
# 	end

# 	def check_for_upward_diagonal_bingo
# 		diagonal_array = []

# 		@board.each_with_index do |nested, index1|
#   			nested.each_with_index do |space, index2|
#     			if index1 + index2 == 4 && space == 'x'
#       				diagonal_array << space
# 			    end
# 			end  
# 		end
# 		@got_bingo = true if diagonal_array.count('x') == 5
# 	end

  
# 	def win_bingo?
# 		check_for_horitzonal_bingo
# 		check_for_vertical_bingo
# 		check_for_downward_diagonal_bingo
# 		check_for_upward_diagonal_bingo
# 		p 'BINGO!' if @got_bingo == true
# 	end

# 	def print_bingo
# 		puts 'BINGO!' if win_bingo == true
# 	end
# end




# Refactored Solution
class BingoScorer

	def initialize(board)
		@board = board
		@got_bingo = false
	end

	def check_for_horitzonal_bingo
		@board.each do |bingo_row|
			@got_bingo = true if bingo_row.uniq.count == 1
		end
	end

	def check_for_vertical_bingo
		transposed_board = @board.transpose
		transposed_board.each do |bingo_column|
			@got_bingo = true if bingo_column.uniq.count == 1
		end
	end

	def check_for_downward_diagonal_bingo
		diagonal_array = []

		@board.each_with_index do |bingo_row, index1|
  			bingo_row.each_with_index do |bingo_space, index2|
    			if index1 == index2
      				diagonal_array << bingo_space
			    end
			end  
		end

		@got_bingo = true if diagonal_array.uniq.count == 1
	end

	def check_for_upward_diagonal_bingo
		diagonal_array = []
		reverse_diagonal = @board.reverse
		reverse_diagonal.each_with_index do |bingo_row, index1|
  			bingo_row.each_with_index do |bingo_space, index2|
    			if index1 == index2
      				diagonal_array << bingo_space
			    end
			end  
		end

		@got_bingo = true if diagonal_array.uniq.count == 1
	end

  
	def win_bingo?
		check_for_horitzonal_bingo
		check_for_vertical_bingo
		check_for_downward_diagonal_bingo
		check_for_upward_diagonal_bingo
		p 'BINGO!' if @got_bingo == true
	end

end





# DRIVER TESTS GO BELOW THIS LINE
# implement tests for each of the methods here:
horizontal = [[47, 44, 71, 8, 88],
              ['x', 'x', 'x', 'x', 'x'],
              [83, 85, 97, 89, 57],
              [25, 31, 96, 68, 51],
              [75, 70, 54, 80, 83]]

horizontal_test = BingoScorer.new(horizontal)
p horizontal_test.win_bingo? == 'BINGO!'

vertical = [[47, 44, 71, 'x', 88],
            [22, 69, 75, 'x', 73],
            [83, 85, 97, 'x', 57],
            [25, 31, 96, 'x', 51],
            [75, 70, 54, 'x', 83]]

vertical_test = BingoScorer.new(vertical)
p vertical_test.win_bingo? == 'BINGO!'

right_to_left = [['x', 44, 71, 8, 88],
                 [22, 'x', 75, 65, 73],
                 [83, 85, 'x', 89, 57],
                 [25, 31, 96, 'x', 51],
                 [75, 70, 54, 80, 'x']]

diagonal_test1 = BingoScorer.new(right_to_left)
p diagonal_test1.win_bingo? == 'BINGO!'

left_to_right = [[47, 44, 71, 8, 'x'],
                  [22, 69, 75, 'x', 73],
                  [83, 85, 'x', 89, 57],
                  [25, 'x', 96, 68, 51],
                  ['x', 70, 54, 80, 83]]

diagonal_test2 = BingoScorer.new(left_to_right)
p diagonal_test2.win_bingo? == 'BINGO!'

no_bingo = [[47, 'x', 'x', 'x', 'x'],
           ['x', 'x', 75, 'x', 'x'],
	       ['x', 85, 100, 89, 'x'],
	       ['x', 'x', 96, 'x', 'x'],
	       ['x', 'x', 'x', 'x', 83]]

no_bingo_test = BingoScorer.new(no_bingo)
p no_bingo_test.win_bingo? == nil

# Reflection
# Overall I have really enjoyed the bingo 1 and 2 challenges.  I have felt confident in deciding on an approach and following through.
# My approach was to look at each type of bingo as a separate method and create my steps from there.
# For each of those methods I decided to use count to determine if there were 5 x's.
# In order to make the methods useable in multiple scenarios, I changed the count to uniq.count == 1 so that this could be applied to a game with more than 5 spaces.
# For horizontal and vertical I used the same method, except for vertical I transposed the board first.  Then applied #each do.
# For diagonal method, I used #each do with index.  To get the downward diagonal I used the fact that the outer and inner index values should be the same to determine which to check.
# Then I created a new array containing the 5 diagonal values so they could be counted just like in the horizontal and vertical methods.
# For the reverse of that diagonal, I decided to reverse the entire board so that the same strategy could again be applied.
# I also changed the names from right-left diagonal because I found those confusing and not intuitive which diagonal they referred to.
# With bingo 2, I am most concerned with my refactoring.
# I think my methods might not be as single-responsiblity as they should, but I'm also not sure about the best way to refactor.
# This is something I want feedback on, and that I will use in my accountability email.
# That part of the code seems not as DRY as it could be, but I would want input on that.
# When I look at my code I see myself doing .uniq.count == 1 in each method, which I think could maybe be called once in the whole class as a separate method.
# I also wonder if for vertical and horzontal if I should do the transpose and then apply one same method to both versions of the board.
# Then I also considered the same idea for diagonal.  Should I reverse the board and apply the same method as the original diagonal?
# Then with all of these ideas, I wonder about variable names and if that kind of impedes these ideas.
# Overall I just want a lot of feedback surrounding refactoring my somewhat refactored code.
