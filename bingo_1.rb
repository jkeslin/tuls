#================================================#
#========== Jeff's General Thoughts =============#
#================================================#
# 1.  With this setup, there's no way to have a 'ball' selected for you at random
#     without initializing a new board since @bingo_letters.sample only occurs during initalization
# 2.  I think there should be a seperate class for handling the selected 'balls' since
#     the 'called_letter' and 'called_number' are not really properties of the board.
# 3.  With a board setup like:
      #[[47, 44, 71, 8, 88],
      #[22, 69, 75, 65, 73],
      #[83, 85, 97, 89, 57],
      #[25, 31, 96, 68, 51],
      #[75, 70, 54, 80, 83]]
      #how does someone reading your code know how the BINGO letters relate to this?
      #obviously people who have played bingo can figure out that each array is a row
      #and that each letter is the head of a column, but it forces you to assume that
      #the person reading/editing your code knows bingo.  In the case of bingo that's
      #probably not a big deal, but when you're writing real world code these sorts of
      #assumptions matter and should be avoided.
# 4.  I'm going to attempt to refactor this program using the following data structure instead:

BOARD = {
  b: [7, 4, 1, 8, 9],
  i: [2, 6, 5, 8, 3],
  n: [3, 8, 9, 1, 7],
  g: [2, 1, 6, 8, 5],
  o: [7, 1, 5, 2, 3]
}
# 5.  I know some issues might arise later with the orientation of the rows/columns,
#     but I'm going to ignore that for now.
# 6.  What I wrote below is probably way off track of whatever guidelines DBC gave
#     you to start with and fails all the rpsec tests, but whatever.  Do 'ruby bingo_1.rb'
#     and see how it goes.
#================================================#
#=========== End of Thoughts ====================#
#================================================#

class Game
  attr_reader :letter, :number

  def initialize
    @bingo_letters = [:b, :i, :n, :g, :o] 
  end
#why use symbols instead of strings?  Just easier with hashes?  Is there something about memory?
  def pick_bingo_ball     
    select_letter && select_number && call_bingo_value
  end
#I've not seen using && with methods, is this typical?
#Also any reason you listed this method above the others?  Or doesn't matter?
  def select_letter
    @letter = @bingo_letters.sample
  end

  def select_number
    @number = rand(1..10)   #did you make this smaller to actually get bingos?
  end

  def call_bingo_value
    puts "="*10   #I like this.  Is this something a lot of people do or just you as you're testing it out?
    puts "#{@letter.to_s.upcase}-#{@number} has been chosen"
  end

end


class BingoBoard
  attr_reader :token

  def initialize
    @bingo_board = BOARD   #why use a constant here?  Is that so you can keep updating the same board?
    @token = "X"
  end

  def check_my_board(letter, number)
    check_column(letter, number)
    print_results
  end

  def check_column(letter, number)
    if    column_contains_called_number?(letter, number)
    then  print_success_message && replace_spot_with_token(letter, number)
    else  print_fail_message
    end
  end

  def column_contains_called_number?(letter, number)
    @bingo_board[letter].include?(number)
  end

  def replace_spot_with_token(letter, number)
    @bingo_board[letter].map! do |board_num|
      if   board_num == number then token
      else board_num
      end
    end
  end
#Why use multiple methods with the same arguments rather than initalizing an instance variable for letter/number?
  def print_success_message
    puts "You have that!"
    true  #why should this return true also?
  end

  def print_fail_message
    puts "Sorry, try again!"
  end

  def print_results
    puts "Your current board:"
    print_updated_board
    puts "="*10
  end

  def print_updated_board
    @bingo_board.each do |header, column|
      puts "#{header.to_s.upcase}:  #{column.join('  ')}"
    end
  end

end

#MEG'S THOUGHTS
#--------------
#This is really fun/helpful to look at.  (Thank you.)  My big ideas are:
# => I remember we talked about doing 2 classes, so I should have done that already.  It's good to see that.  I still have trouble having classes communicate.
# => I see the better single responsibility methods
# => I like that yours has visual improvements when printed to console
# => Although the hashes are sideways as you pointed out, they are far easier to work with when iterating because you don't need double index values which is hard to read and follow.
# => Let's say I wanted to make an authentic BINGO game: "B" (numbers 1–15), "I" (numbers 16–30), "N" (numbers 31–45), "G" (numbers 46–60), and "O" (numbers 61–75) with a free space in the middle.
# => How would I do that?  Would I have a separate class that creates the BOARD?  Would I have a method for each bingo letter?  method "B" method "I" etc?
# => I have the bingo_2 file which is a class that checks for BINGOS.  Ideally I would combine these together.  I might work on that.
#--------------

#DRIVER TESTS GO BELOW THIS LINE
#======================
my_board = BingoBoard.new
game = Game.new

10.times do
  game.pick_bingo_ball
  my_board.check_my_board(game.letter, game.number)
end
#next you would probably wanna write something to check and see if you have bingo. fun!
#======================

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
