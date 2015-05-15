require 'benchmark'

def megs_approach
  integers = [*1..100_000]
  fizzbuzz_array = []
  fizzbuzz_array.push(numbers.map{ |integer| integer %3 == 0 && integer %5 ==0 ? "fizzbuzz": 
  	integer %3 == 0 ? "fizz" : 
  	integer %5 == 0 ? "buzz" : 
  	integer })
  puts fizzbuzz_array
end
# megs_approach




#hey tuls
#first off, great work.  It's elegant and pristine and works like a charm.
#That being said, there are ways to "improve" it. (in quotes because its somewhat subjective)
#Two things that instructors at DBC would tell you is to:
#1. make it more readable
#2. make it more modular, or follow the tenants of "single responsibility"

#About Readability

#your array name "poopy".  A clever name no doubt, but to the next developer who has to read, validate, or edit your code, what will they know about the poopy array? What will they think it represents? And the variable "e", what is e to another developer? Will he/she know what your intentions were by reading this program?  Using one letter is appealing because it's short and requires the least amount of work for a computer to read, but that fraction of a millisecond that it saves the user, is nothing compared to the hours of developer time that can be saved by having code that is readable.  Don't ever worry about having variable names that are too long or wordy, it's a good thing.

#About Single Responsibility
#it was clever to combine the push and map functions into one line (also if you use "map!" it changes the original array permanently and you don't have to push it into a new one), but that one line is responsible for a lot of logic and cannot easily be edited, or quickly understood by another developer (we're pretending this is actually a much more complicated program than fizzbuzz for the sake of instruction).

#Allow me to propose a refactored solution that is not nearly as elegant as yours, but demonstrates readability and single responsibility.

#Now, keep in mind:
#Is my solution better than yours? No.
#Are there millions of coders who would say that yours is more a more proper solution? Yes.
#Is my solution overly verbose and completely unnecessary for something as simple as fizzbuzz? Yes.
#But does it adequately demonstrate the two principles above that will be stressed as "best practices" at DBC and your subsequent career? Yes.

#in regards to performance: in running a benchmark on each of our programs to 100,000 integers, the CPU time was almost indistinguishable. Both clocking in at ~ 700 milliseconds on average (and most of that is the actual printing of the integers. Just running the algo without printing anything to the console, the time is cut down to ~ 45 milliseconds)


#----Keslin's obnoxious rubyist inspired solution----#
def build_array_from_range(min, max)
  (min..max).to_a
end
#to_a makes a new array, right??
# => Yes

#does this convention allow for more quick changing of the parameters or why the min, max vs. 1, 100>
# => I went with using min and max as arguments so that I could easily run the program using the numbers of my choice instead of just 1 and 100.

#ruby convention: if method is designed to return a boolean, end it with a question mark
#this makes sense.  i think i thought when i saw ? in previous lessons they were required for the method to work - but it's simply a convention?
# =>simply a convention, yes.  The way you used the "?" in your solution was different however.  that was a ternary operator, which is a nice way of writing an if/else statement in one line of code. Here's a nice little tutorial on that subject: http://rubylearning.com/satishtalim/simple_constructs.html

def replace_with_fizz?(integer)
  integer % 3 == 0
end

def replace_with_buzz?(integer)
  integer % 5 == 0
end

def replace_with_fizzbuzz?(integer)
  integer % 3 == 0 && integer % 5 == 0
end
#why is it better to make each of these their own defined method?
# =>it makes the code easier to maintain and edit and reuse in other places.  Not at all necessary, for something like fizzbuzz, but a good habit for when things get more complicated.  It's like if you had design drawings for a house.  It's easier to work with if the plumbing schematic is on one page, and the electrical is on another, and the heating/AC is on another page, etc. 

def check_for_replacement(integers_array)
  integers_array.map! do |integer|
    if    replace_with_fizzbuzz?(integer) then "fizzbuzz"
    elsif replace_with_buzz?(integer)     then "buzz"
    elsif replace_with_fizz?(integer)     then "fizz"
    else  integer
    end
  end
  integers_array
end
#generally should I use if, elseif, else rather than : and ?
# =>totally up to you, I just like the ifs and thens cause it forms a sentence-ish.
#did you have to define integers_array or if you put _array will it automatically make it an array
# =>integers_array could have been called anything.  what matters is that when I CALL the check_for_replacement method (like in like 93) that the argument I give it is an array

def print_fizzbuzzed(array)
  puts array
end
#why is this definition here?
# => it's not really necessary, again it's really just overkill on trying to demonstrate readability 

#this method is the runner, so to speak
def solve_fizzbuzz(min, max)
  fizzbuzzed = check_for_replacement(build_array_from_range(min, max))
  print_fizzbuzzed(fizzbuzzed)
end

#-----------------#
#driver code below#
#-----------------#

solve_fizzbuzz(1, 100_000)



#TRYING to get a random integers? Try:
#rand(6) + 1
#or
# Random.new.rand(5) + 1
#or something like that.


