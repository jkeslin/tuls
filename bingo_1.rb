# U2.W5: A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent [#] hours on this challenge.
#12:25

# Release 0: Pseudocode
# Outline:

# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)
  #fill in the outline here
  # => create letter array with BINGO and take one sample in new array that is the called letter
  # => generate random number 1 to 100 and assign to the variable called number


# Check the called column for the number called.
  #fill in the outline here
  # => check if the column is in the nested array with index 0, 1, 2, 3 or 4
  

# If the number is in the column, replace with an 'x'
  #fill in the outline here
  # => once there's a match, check if the number compares to any of the elements in that position

# Display a column to the console
  #fill in the outline here
  # => print the column to the console???

# Display the board to the console (prettily)
  #fill in the outline here
  # => print bingo board one nested array at a time

# Release 1: Initial Solution

# class BingoBoard

#   attr_accessor :called_letter, :called_number

#   def initialize(board)
#     @bingo_board = board
#     @called_letter = nil
#     @called_number = nil
#   end

#   def call_bingo_value
#     if @called_number == nil && @called_letter == nil
#     letters = ['B', 'I' , 'N' ,'G', 'O']
#     @called_letter = letters.sample
#     @called_number = rand(1..100)
#     end

#     puts "You got #{@called_letter}-#{@called_number.to_s}"
#   end
  
#   def check_column
#     @transposed_board = @bingo_board.transpose
#     case @called_letter
#       when "B"
#         puts @column = @transposed_board[0]
#       when "I"
#         puts @column = @transposed_board[1]
#       when "N"
#         puts @column = @transposed_board[2]
#       when "G"
#         puts @column = @transposed_board[3]
#       when "O"
#         puts @column = @transposed_board[4]
#     end
#   end

#   def check_bingo_value
#     @column.map! do |number| 
#       if number == @called_number then 'X'
#       else number
#       end
#     end
#   end

#   def print_updated_board
#     puts "Your bingo board:"
#     @transposed_board.transpose.each do |number|
#       puts number.join(' ')
#     end
#   end

#   def play_bingo
#     call_bingo_value
#     check_column
#     check_bingo_value
#     print_updated_board
#   end

# end

# Release 3: Refactored Solution
# REFACTORED AFTER DBC FEEDBACK
class BingoBoard

  attr_accessor :called_letter, :called_number

  def initialize(board)
    @bingo_board = board
    @bingo_letters = ['B', 'I' , 'N' ,'G', 'O']
    @called_letter = @bingo_letters.sample
    @called_number = rand(1..100)
  end

  def call_bingo_value
    # if @called_number == nil && @called_letter == nil
    # @called_letter = @bingo_letters.sample
    # @called_number = rand(1..100)
    # end
    puts "You got #{@called_letter}-#{@called_number.to_s}"
  end
  
  def check_column
    column_index = @bingo_letters.index(@called_letter)

    @bingo_board.each do |bingo_row|
        puts bingo_row[column_index]
    end

    # puts @column

    # REFACTOR OPTION 1:  this was the first idea to automate the index verses using the case/when structure for each letter
    # => @transposed_board = @bingo_board.transpose
    # => @column = @transposed_board[@bingo_letters.index(@called_letter)]
    # 
    # INITIAL CODE (removed):
    # case @called_letter
    #   when "B"
    #     puts @column = @transposed_board[0]
    #   when "I"
    #     puts @column = @transposed_board[1]
    #   when "N"
    #     puts @column = @transposed_board[2]
    #   when "G"
    #     puts @column = @transposed_board[3]
    #   when "O"
    #     puts @column = @transposed_board[4]
    # end
  end

  def check_bingo_value
    
    # REFACTORED CODE AFTER DBC FEEDBACK
    # column_index = @bingo_letters.index(@called_letter)

    @bingo_board.each do |bingo_row|
      bingo_row.map! do |bingo_space|
        if bingo_space == @called_number then 'X'
        else bingo_space
        end
      end
    end

    # INITIAL METHOD CODE:
    # p @bingo_board
    # @column.map! do |number| 
    #   if number == @called_number then 'X'
    #   else number
    #   end
    # end
  end

  def print_updated_board
    puts "Your bingo board:"
    @bingo_board.each do |number|
      puts number.join(' ')
    end
  end

  def play_bingo
    call_bingo_value
    check_column
    check_bingo_value
    print_updated_board
  end

end

# Release 2: DRIVER TESTS GO BELOW THIS LINE
board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]

game = BingoBoard.new(board)
game.play_bingo

game_1 = BingoBoard.new(board)
game_1.called_letter='G'
game_1.called_number=68
p game_1.play_bingo[3][3] == 'X'

game_2 = BingoBoard.new(board)
game_2.called_letter='O'
game_2.called_number=88
p game_2.play_bingo[0][4] == 'X'



# Release 4: Reflection
# I really enjoyed this challenge.  Since it does not have rspec tests created, I am also hoping that I followed the directions correctly; however, I ran some tests and it returned what I expected.
# I enjoyed the combination of thinking of each method and step individually while also having a big picture of how they might connect.
# My general approach was seeing the big picture first, then considering each small step along the way.
# I outlined my method and the necessary variables for each part of the process.
# I completed one method at a time, and made sure what I expected was returned at each step.  I would print to the screen and use the existing board.
# I would also use irb to do small experimenting along the way.  Especially when printing the nested arrays how I wanted them.
# When I completed the final piece, I added attr accessors to the letter and number so I could override them with values on the bingo board to test for the appearance of 'X' since the likelihood of actually acheiving this randomly is low.
# If this were a true bingo board I would have ran the test n times to see it happen more naturally.
# It was good to test specific values and to run the file multiple times because I found an error that only happened when I selected "O" because of a typo.
# I wish I had more time to do the extension of creating a more realistic bingo board.  
# Again, I found this to be a challenge that really helped me with working on the sort of "extra" skills of coding like pseudocode, breaking it down, and running tests.
# I am still struggling to refactor.  I think maybe I do too much refactoring as I write the code, and tnen also at the end I need to ask for feedback on refactoring so I can better see the process.
# I think a good challenge in week 4 and week 5 for future DBC cohorts would be to exchange code with a partner and refactor.  That should be a paired challenge.  Write the solutions independently, and then the pairing is refactoring.

