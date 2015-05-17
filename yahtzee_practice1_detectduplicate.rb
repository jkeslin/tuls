def check_for_duplicate_values
	die_array = [1, 3, 3, 1, 1]
	die_array.detect{ |values| die_array.count(values) > 1 }
end

check_for_duplicate_values