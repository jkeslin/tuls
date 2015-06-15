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
	return group_numbers_array = (1..num_of_groups).cycle(num_of_groups)
end


def create_groups(member_array, group_size, num_per_group)
	group_assignment = Hash[member_array.shuffle!.zip(create_group_numbers(group_size, num_per_group))]
	
	group_1 = []
	group_2 = []
	group_3 = []
	group_4 = []
	group_5 = []
	
	group_assignment.each {|name, group| group_1 << name if group == 1 }
	group_assignment.each {|name, group| group_2 << name if group == 2 }
	group_assignment.each {|name, group| group_3 << name if group == 3 }
	group_assignment.each {|name, group| group_4 << name if group == 4 }
	group_assignment.each {|name, group| group_5 << name if group == 5 }

	puts "Accountability Group 1 members are #{group_1.join(', ')}."
	puts "Accountability Group 2 members are #{group_2.join(', ')}."
	puts "Accountability Group 3 members are #{group_3.join(', ')}."
	puts "Accountability Group 4 members are #{group_4.join(', ')}."
	puts "Accountability Group 5 members are #{group_5.join(', ')}."
end

member_array = ["Agustin Chavez","Alex Green","Anda Cabrera","Catherine McLoughlin","Chris Stavitsky","Cole Campbell","Daniel Stanojevic","Emily Webber","Gray Edstrom","LilyTherese Walla","Matt Behan","Meg Tuls","Michael P Mapes","Nathan Vanderlaan","Eva PenzeyMoog","Nic Lombardi","Philip Sugg","Rodica Trifan","Sheena Bryant","Nicole Carpenter"]
group_size = member_array.size
num_per_group = 4
create_groups(member_array, group_size, num_per_group)
