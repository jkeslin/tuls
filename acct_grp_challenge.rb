# def create_groups(member_array)
# 	group1 = member_array.slice(1..4).join(', ')
# 	puts "Group 1 includes #{group1}"
# 	group2 = member_array.slice(5..8)
# 	puts group2
# end

# def divide_groups(member_array)
# 	p groups_array = member_array.shuffle!.each_slice(4).to_a
# end


def create_group_numbers(group_size, num_per_group)
	num_of_groups = group_size/num_per_group
	#cycle is probably a cool method, and I applaud your use of it, but will the person reading the code understand what's happening to the
	#groups in line 18 just by reading it?  Only use .cycle if reading it intuitively explains what's happening to the data.
	#sometimes it'll fit and sometimes it won't.  Don't be afraid to use more lines of code if it makes it more intuitive or readable
	return group_numbers_array = (1..num_of_groups).cycle(num_of_groups)
end


def create_groups(member_array, group_size, num_per_group)
	#in line 26, you: 1. shuffle the array, 2. zip it, 3. create group members, 4. create a new hash.
	#each of these actions can be their own method.  putting them all on one line can make your program inflexible and 
	#difficult to test or adapt.  remember my comments about 'single responsibility'
	group_assignment = Hash[member_array.shuffle!.zip(create_group_numbers(group_size, num_per_group))]
	
	#below there are 3 instances where you do the same action 5 times.
	#whenever you notice that happen it's a sign that you can turn that operation into a method and call it multiple times
	#that'll make your code more 'DRY' (Don't Repeat Yourself)
	group_1 = []
	group_2 = []
	group_3 = []
	group_4 = []
	group_5 = []
	
	#consider revising your data structure to something like:
	groups = {1: [...], 2: [...], 3: [...], 4: [...], 5: [...] } #maybe?
	
	group_assignment.each {|name, group| group_1 << name if group == 1 }
	group_assignment.each {|name, group| group_2 << name if group == 2 }
	group_assignment.each {|name, group| group_3 << name if group == 3 }
	group_assignment.each {|name, group| group_4 << name if group == 4 }
	group_assignment.each {|name, group| group_5 << name if group == 5 }

	#stuff below could be a seperate method that prints your results that gets called for each group
	#something like:
	#def print_group_results(current_group)
		#puts "Accountability Group 1 members are #{current_group.join(', ')}."
	#end
	puts "Accountability Group 1 members are #{group_1.join(', ')}."
	puts "Accountability Group 2 members are #{group_2.join(', ')}."
	puts "Accountability Group 3 members are #{group_3.join(', ')}."
	puts "Accountability Group 4 members are #{group_4.join(', ')}."
	puts "Accountability Group 5 members are #{group_5.join(', ')}."
end

member_array = ["Agustin Chavez","Alex Green","Anda Cabrera","Catherine McLoughlin","Chris Stavitsky","Cole Campbell","Daniel Stanojevic","Emily Webber","Gray Edstrom","LilyTherese Walla","Matt Behan","Meg Tuls","Michael P Mapes","Nathan Vanderlaan","Eva PenzeyMoog","Nic Lombardi","Philip Sugg","Rodica Trifan","Sheena Bryant","Nicole Carpenter"]
#the word 'group' becomes ambiguous if you use it for both the initial collection of names, and the resulting 'groups'
#maybe call group_size something like 'total_members' instead
#to me, group_size sounds like it's going to represent what 'num_per_group' actually represents
group_size = member_array.size
num_per_group = 4
create_groups(member_array, group_size, num_per_group)
